package net.unicoen.generator

import net.unicoen.uniMapperGenerator.ActionElement
import net.unicoen.uniMapperGenerator.AltList
import net.unicoen.uniMapperGenerator.Alternative
import net.unicoen.uniMapperGenerator.Atom
import net.unicoen.uniMapperGenerator.Block
import net.unicoen.uniMapperGenerator.BlockSet
import net.unicoen.uniMapperGenerator.Ebnf
import net.unicoen.uniMapperGenerator.EbnfSuffix
import net.unicoen.uniMapperGenerator.Element
import net.unicoen.uniMapperGenerator.ElementOption
import net.unicoen.uniMapperGenerator.ElementOptions
import net.unicoen.uniMapperGenerator.ElementWithDollar
import net.unicoen.uniMapperGenerator.EmptyTokens
import net.unicoen.uniMapperGenerator.ExceptionGroup
import net.unicoen.uniMapperGenerator.ExceptionHandler
import net.unicoen.uniMapperGenerator.FinallyClause
import net.unicoen.uniMapperGenerator.Grammar
import net.unicoen.uniMapperGenerator.GrammarAction
import net.unicoen.uniMapperGenerator.GrammarType
import net.unicoen.uniMapperGenerator.Import
import net.unicoen.uniMapperGenerator.Imports
import net.unicoen.uniMapperGenerator.LabeledAlt
import net.unicoen.uniMapperGenerator.LabeledElement
import net.unicoen.uniMapperGenerator.LabeledLexerElement
import net.unicoen.uniMapperGenerator.LexerAlt
import net.unicoen.uniMapperGenerator.LexerAltList
import net.unicoen.uniMapperGenerator.LexerAtom
import net.unicoen.uniMapperGenerator.LexerBlock
import net.unicoen.uniMapperGenerator.LexerCharSet
import net.unicoen.uniMapperGenerator.LexerCommand
import net.unicoen.uniMapperGenerator.LexerCommandExpr
import net.unicoen.uniMapperGenerator.LexerCommands
import net.unicoen.uniMapperGenerator.LexerElement
import net.unicoen.uniMapperGenerator.LexerElementWithDollar
import net.unicoen.uniMapperGenerator.LexerElements
import net.unicoen.uniMapperGenerator.LexerRule
import net.unicoen.uniMapperGenerator.LocalVars
import net.unicoen.uniMapperGenerator.Mode
import net.unicoen.uniMapperGenerator.NotSet
import net.unicoen.uniMapperGenerator.Option
import net.unicoen.uniMapperGenerator.OptionValue
import net.unicoen.uniMapperGenerator.Options
import net.unicoen.uniMapperGenerator.ParserRule
import net.unicoen.uniMapperGenerator.QualifiedId
import net.unicoen.uniMapperGenerator.Range
import net.unicoen.uniMapperGenerator.Return
import net.unicoen.uniMapperGenerator.RuleAction
import net.unicoen.uniMapperGenerator.RuleAltList
import net.unicoen.uniMapperGenerator.RuleRef
import net.unicoen.uniMapperGenerator.SetElement
import net.unicoen.uniMapperGenerator.Terminal
import net.unicoen.uniMapperGenerator.TokenVocab
import net.unicoen.uniMapperGenerator.V3Token
import net.unicoen.uniMapperGenerator.V3Tokens
import net.unicoen.uniMapperGenerator.V4Token
import net.unicoen.uniMapperGenerator.V4Tokens
import net.unicoen.uniMapperGenerator.Wildcard
import org.eclipse.xtext.generator.IFileSystemAccess

class ANTLRGrammarGenerator {
	private IFileSystemAccess _fsa
	private val ext = ".g4";
	private val nl = System.getProperty("line.separator")

	new(IFileSystemAccess fsa) {
		_fsa = fsa
	}

	def generate(String name, Grammar grammar) {
		_fsa.generateFile(name + ext, grammar.compile)
	}

	def dispatch compile(Grammar g) {
		val sb = new StringBuilder
		sb.append(g.nameCompile + nl + nl)
		sb.append(header + nl + nl)
		g.prequels.forEach [
			sb.append(it.compile + nl)
		]
		g.rules.forEach [
			sb.append(it.compile + nl)
		]
		g.modes.forEach [
			sb.append(it.compile + nl)
		]
		sb.toString
	}

	def nameCompile(Grammar g) '''«IF g.type != null && !g.type.equals(GrammarType.DEFAULT)»«g.type» «ENDIF»grammar «g.
		name»;'''

	def header() '''@header{
	package net.unicoen.parser;
}'''

	def dispatch compile(Options op) '''«op.keyword»«FOR o : op.options» «o.compile»;«ENDFOR»}'''

	def dispatch compile(Option o) '''«o.name» = «o.value.compile»'''

	def dispatch compile(TokenVocab tv) '''«tv.name» = «tv.importURI»'''

	def dispatch compile(
		OptionValue opv) '''«IF opv.qopValue != null»«opv.qopValue»«ELSEIF opv.strValue != null»'«opv.strValue»'«ELSEIF opv.
		aopValue != null»«ELSE»«ENDIF»'''

	def dispatch compile(Imports im) '''«im.keyword» «FOR i : im.imports»«IF !im.imports.get(0).equals(i)», «ENDIF»«i.
		compile»«ENDFOR»'''

	def dispatch compile(Import i) '''«IF !i.alias.empty»«i.alias» = «ENDIF»«i.importURI»'''

	def dispatch compile(V4Tokens v4) '''«v4.keyword» «FOR t : v4.tokens»«IF !v4.tokens.get(0).equals(t)», «ENDIF»«t.
		compile»«ENDFOR»'''

	def dispatch compile(V4Token v4) '''«v4.name»'''

	def dispatch compile(EmptyTokens et) '''«et.keyword»}'''

	def dispatch compile(V3Tokens v3) '''«v3.keyword»«FOR t : v3.tokens» «t.compile»«ENDFOR»}'''

	def dispatch compile(V3Token v3) '''«v3.name»«IF !v3.value.empty» = «v3.value»«ENDIF»;'''

	def dispatch compile(GrammarAction ga) '''@«IF !ga.scope.empty»«ga.scope» «ga.colonSymbol» «ENDIF»«ga.
		name» «ga.action»'''

	def dispatch compile(Mode m) '''mode «m.id»;«FOR lr : m.rules»«lr.compile»«ENDFOR»'''

	def dispatch compile(
		ParserRule pr
	) '''«pr.name»«IF pr.^return != null» «pr.^return.compile»«ENDIF»«IF pr.throws !=
		null» «pr.throws.compile»«ENDIF»«IF pr.locals != null» «pr.locals.compile»«ENDIF»«FOR p : pr.prequels» «p.compile»«ENDFOR» :
		«pr.body.compile»«pr.caught.compile»«pr.semicolonSymbol»'''

	def dispatch compile(
		ExceptionGroup eg) '''«FOR e : eg.handlers»«ENDFOR»«IF eg.^finally != null»«eg.^finally.compile»«ENDIF»'''

	def dispatch compile(ExceptionHandler eh) '''catch «eh.exception» «eh.body»'''

	def dispatch compile(FinallyClause fc) '''finally «fc.body»'''

	def dispatch compile(Return re) '''returns «re.body»'''

	def dispatch compile(net.unicoen.uniMapperGenerator.Exceptions ex) '''throws «FOR e : ex.exceptions»«IF !ex.
		exceptions.get(0).equals(e)»,«ENDIF» «e»«ENDFOR»'''

	def dispatch compile(LocalVars lv) '''locals «lv.body»'''

	def dispatch compile(RuleAction ra) '''@«ra.name» «ra.body»'''

	def dispatch compile(RuleAltList ral) '''«FOR a : ral.alternatives»«IF !ral.alternatives.get(0).equals(a)»| «ENDIF»«a.
		compile»«ENDFOR»'''

	def dispatch compile(LabeledAlt la) '''«la.body.compile»«IF la.label != null» #«la.label»«ENDIF»'''

	def dispatch compile(Alternative al) '''«IF al.options != null»«al.options.compile» «ENDIF»«FOR e : al.elements»«e.
		compile»«ENDFOR»'''

	def dispatch compile(ElementWithDollar lad) '''«lad.body.compile»'''

	def dispatch compile(Element el) '''«el.body.compile»«IF el.operator != null»«el.operator.compile»«ENDIF» '''

	def dispatch compile(Ebnf eb) '''«eb.body.compile»«IF eb.operator != null» «eb.operator.compile»«ENDIF»'''

	def dispatch compile(ActionElement ae) '''«ae.body»«IF ae.options != null»«ae.options.compile»«ENDIF»'''

	def dispatch compile(LabeledElement le) '''«le.name» «le.op» «le.body.compile»'''

	def dispatch compile(EbnfSuffix es) '''«es.operator»«IF es.nongreedy != null» «es.nongreedy»«ENDIF»'''

	def dispatch compile(Block bl) '''(«IF bl.colon != null»«IF bl.options != null»«bl.options.compile»«ENDIF»«FOR a : bl.
		actions» «a.compile»«ENDFOR»:«ENDIF» «bl.body.compile»)'''

	def dispatch compile(AltList al) '''«FOR a : al.alternatives»«IF !al.alternatives.get(0).equals(a)»|«ENDIF» «a.
		compile»«ENDFOR»'''

	def dispatch compile(Atom at) '''«at.body.compile»'''

	def dispatch compile(
		RuleRef rr) '''«rr.reference.name»«rr.args»«IF rr.options != null»«rr.options.compile»«ENDIF»'''

	def dispatch compile(ElementOptions eo) '''<«FOR o : eo.options»«o.compile»,«ENDFOR»>'''

	def dispatch compile(Range ra) ''''«ra.from»'..'«ra.to»' '''

	def dispatch compile(
		Terminal te
	) '''«IF te.reference != null»«te.reference.refCompile»«IF te.options != null»«te.
		options.compile»«ENDIF»«ELSEIF te.literal != null»'«te.literal»'«IF te.options != null» «te.options.compile»«ENDIF»«
	ELSE»«te.
		eof»«ENDIF»'''

	def dispatch compile(NotSet ns) '''~«ns.body.compile»'''

	def dispatch compile(
		BlockSet bs) '''(«FOR e : bs.elements»«IF !bs.elements.get(0).equals(e)»|«ENDIF»«e.compile»«ENDFOR»)'''

	def dispatch compile(
		SetElement se
	) '''«IF se.tokenRef != null»«se.tokenRef»«ELSEIF se.stringLiteral != null»'«se.stringLiteral»'«ELSEIF se.
		range != null»«se.range»«ELSE»«se.charSet»«ENDIF»'''

	def dispatch compile(Wildcard wi) '''«wi.dot»«IF wi.options != null»«wi.options.compile»«ENDIF»'''

	def dispatch compile(ElementOption eo) '''«IF eo.qualifiedId != null»«eo.qualifiedId.compile»«ELSE»«eo.id» «eo.
		assign» «eo.value»«ENDIF»'''

	def dispatch compile(LexerRule lr) '''«IF lr.^fragment»fragment «ENDIF»«lr.name» :
	«lr.body.compile»;'''

	def dispatch compile(LexerAltList lal) '''«FOR a : lal.alternatives»«IF !lal.alternatives.get(0).equals(a)»|«ENDIF»«a.
		compile»«ENDFOR»'''

	def dispatch compile(LexerAlt la) '''«la.body.compile» «IF la.commands != null»«la.commands.compile»«ENDIF»'''

	def dispatch compile(LexerElements le) '''«FOR e : le.elements»«e.compile»«ENDFOR»'''

	def dispatch compile(LexerElementWithDollar led) '''«led.body.compile»'''

	def dispatch compile(LexerElement le) '''«le.body.compile»«IF le.operator != null»«le.operator.compile»«ENDIF»'''

	def dispatch compile(LabeledLexerElement lle) '''«lle.label» «lle.op» «lle.body.compile»'''

	def dispatch compile(LexerAtom la) '''«la.body.compile»'''

	def dispatch compile(LexerCharSet lcs) '''«lcs.body»'''

	def dispatch compile(LexerBlock lb) '''(«IF lb.options != null»«lb.options» :«ENDIF»«lb.body.compile»)'''

	def dispatch compile(LexerCommands lc) '''«lc.keyword»«FOR c : lc.commands»«IF !lc.commands.get(0).equals(c)»|«ENDIF»«c.
		compile»«ENDFOR»'''

	def dispatch compile(LexerCommand lc) '''«lc.name»«IF lc.args != null»(«lc.args.compile»)«ENDIF»'''

	def dispatch compile(LexerCommandExpr lce) '''«IF lce.ref != null»«lce.ref.compile»«ELSE»«lce.value»«ENDIF»'''

	def dispatch compile(QualifiedId qi) '''«FOR n : qi.name»«n».«ENDFOR»'''

	def dispatch refCompile(V3Token v3) '''«v3.name» = '«v3.value»';'''

	def dispatch refCompile(V4Token v4) '''«v4.name»'''

	def dispatch refCompile(LexerRule lr) '''«lr.name»'''

}