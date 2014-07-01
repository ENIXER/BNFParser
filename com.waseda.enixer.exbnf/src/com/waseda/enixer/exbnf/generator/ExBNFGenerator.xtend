/*
 * generated by Xtext
 */
package com.waseda.enixer.exbnf.generator

import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.IGenerator
import org.eclipse.xtext.generator.IFileSystemAccess
import com.waseda.enixer.exbnf.exBNF.Grammar
import com.waseda.enixer.exbnf.exBNF.Options
import com.waseda.enixer.exbnf.exBNF.Imports
import com.waseda.enixer.exbnf.exBNF.GrammarAction
import com.waseda.enixer.exbnf.exBNF.Option
import com.waseda.enixer.exbnf.exBNF.TokenVocab
import com.waseda.enixer.exbnf.exBNF.Mode
import com.waseda.enixer.exbnf.exBNF.QualifiedOption
import com.waseda.enixer.exbnf.exBNF.StringOption
import com.waseda.enixer.exbnf.exBNF.ActionOption
import com.waseda.enixer.exbnf.exBNF.IntOption
import com.waseda.enixer.exbnf.exBNF.Import
import com.waseda.enixer.exbnf.exBNF.V4Tokens
import com.waseda.enixer.exbnf.exBNF.V4Token
import com.waseda.enixer.exbnf.exBNF.EmptyTokens
import com.waseda.enixer.exbnf.exBNF.V3Tokens
import com.waseda.enixer.exbnf.exBNF.V3Token
import com.waseda.enixer.exbnf.exBNF.ParserRule
import com.waseda.enixer.exbnf.exBNF.Return
import com.waseda.enixer.exbnf.exBNF.LocalVars
import com.waseda.enixer.exbnf.exBNF.ExceptionGroup
import com.waseda.enixer.exbnf.exBNF.RuleBlock
import com.waseda.enixer.exbnf.exBNF.LexerRule
import com.waseda.enixer.exbnf.exBNF.GrammarType
import com.waseda.enixer.exbnf.exBNF.ExceptionHandler
import com.waseda.enixer.exbnf.exBNF.FinallyClause
import com.waseda.enixer.exbnf.exBNF.RuleAction
import com.waseda.enixer.exbnf.exBNF.RuleAltList
import com.waseda.enixer.exbnf.exBNF.LabeledAlt
import com.waseda.enixer.exbnf.exBNF.Alternative
import com.waseda.enixer.exbnf.exBNF.Element
import com.waseda.enixer.exbnf.exBNF.EbnfSuffix
import com.waseda.enixer.exbnf.exBNF.Ebnf
import com.waseda.enixer.exbnf.exBNF.ActionElement
import com.waseda.enixer.exbnf.exBNF.LabeledElement
import com.waseda.enixer.exbnf.exBNF.Block
import com.waseda.enixer.exbnf.exBNF.AltList
import com.waseda.enixer.exbnf.exBNF.Atom
import com.waseda.enixer.exbnf.exBNF.RuleRef
import com.waseda.enixer.exbnf.exBNF.Terminal
import com.waseda.enixer.exbnf.exBNF.NotSet
import com.waseda.enixer.exbnf.exBNF.BlockSet
import com.waseda.enixer.exbnf.exBNF.SetElement
import com.waseda.enixer.exbnf.exBNF.Wildcard
import com.waseda.enixer.exbnf.exBNF.ElementOption
import com.waseda.enixer.exbnf.exBNF.LexerRuleBlock
import com.waseda.enixer.exbnf.exBNF.LexerAltList
import com.waseda.enixer.exbnf.exBNF.LexerAlt
import com.waseda.enixer.exbnf.exBNF.LexerElements
import com.waseda.enixer.exbnf.exBNF.LexerElement
import com.waseda.enixer.exbnf.exBNF.LabeledLexerElement
import com.waseda.enixer.exbnf.exBNF.LexerAtom
import com.waseda.enixer.exbnf.exBNF.LexerCharSet
import com.waseda.enixer.exbnf.exBNF.LexerBlock
import com.waseda.enixer.exbnf.exBNF.LexerCommands
import com.waseda.enixer.exbnf.exBNF.LexerCommand
import com.waseda.enixer.exbnf.exBNF.LexerCommandExpr
import com.waseda.enixer.exbnf.exBNF.QualifiedId
import com.waseda.enixer.exbnf.exBNF.ElementOptions

/**
 * Generates code from your model files on save.
 * 
 * see http://www.eclipse.org/Xtext/documentation.html#TutorialCodeGeneration
 */
class ExBNFGenerator implements IGenerator {
	val nl = System.getProperty("line.separator")

	override def doGenerate(Resource resource, IFileSystemAccess fsa) {
		var list = resource.allContents.toIterable.filter(Grammar)
		for (g : list) {
			var fileName = g.name + ".g4";
			var content = g.compile as CharSequence
			fsa.generateFile(fileName, content);
		}
	}

	def dispatch compile(Grammar g) {
		var sb = new StringBuilder
		sb.append(g.nameCompile + nl)
		for (p : g.prequels)
			sb.append(p.compile + nl)
		for (r : g.rules)
			sb.append(r.compile + nl)
		for (m : g.modes)
			sb.append(m.compile + nl)
		return sb
	}

	def nameCompile(Grammar g) '''«IF g.type != null»«IF !g.type.equals(GrammarType.DEFAULT)»«g.type» «ENDIF»«ENDIF»grammar «g.
		name»;'''

	def dispatch compile(Options op) '''«op.keyword»«FOR o : op.options» «o.compile»;«ENDFOR»}'''

	def dispatch compile(Option o) '''«o.name» = «o.value.compile»'''

	def dispatch compile(TokenVocab tv) '''«tv.name» = «tv.importURI»'''

	def dispatch compile(QualifiedOption qo) '''«qo.value.compile»'''

	def dispatch compile(StringOption so) '''«so.value»'''

	def dispatch compile(ActionOption ao) '''«ao.value»'''

	def dispatch compile(IntOption io) '''«io.value»'''

	def dispatch compile(Imports im) '''«im.keyword» «FOR i : im.imports»«IF !im.imports.findFirst[].equals(i)», «ENDIF»«i.
		compile»«ENDFOR»'''

	def dispatch compile(Import i) '''«IF !i.alias.empty»«i.alias» = «ENDIF»«i.importURI»'''

	def dispatch compile(V4Tokens v4) '''«v4.keyword» «FOR t : v4.tokens»«IF !v4.tokens.findFirst[].equals(t)», «ENDIF»«t.
		compile»«ENDFOR»'''

	def dispatch compile(V4Token v4) '''«v4.name»'''

	def dispatch compile(EmptyTokens et) '''«et.keyword»}'''

	def dispatch compile(V3Tokens v3) '''«v3.keyword»«FOR t : v3.tokens» «t.compile»«ENDFOR»}'''

	def dispatch compile(V3Token v3) '''«v3.id»«IF !v3.value.empty» = «v3.value»«ENDIF»;'''

	def dispatch compile(GrammarAction ga) '''«ga.atSymbol»«IF !ga.scope.empty»«ga.scope» «ga.colonSymbol» «ENDIF»«ga.
		name» «ga.action»'''

	def dispatch compile(Mode m) '''mode «m.id»;«FOR lr : m.rules»«lr.compile»«ENDFOR»'''

	def dispatch compile(ParserRule pr) '''«pr.name»«IF pr.^return != null» «pr.^return.compile»«ENDIF»«IF pr.throws !=
		null» «pr.throws.compile»«ENDIF»«IF pr.locals != null» «pr.locals.compile»«ENDIF»«FOR p : pr.prequels» «p.compile»«ENDFOR» : «pr.
		body.compile»«pr.caught.compile»«pr.semicolonSymbol»'''

	def dispatch compile(ExceptionGroup eg) '''«FOR e : eg.handlers»«ENDFOR»«IF eg.^finally != null»«eg.^finally.compile»«ENDIF»'''

	def dispatch compile(ExceptionHandler eh) '''catch «eh.exception» «eh.body»'''

	def dispatch compile(FinallyClause fc) '''finally «fc.body»'''

	def dispatch compile(Return re) '''returns «re.body»'''

	def dispatch compile(com.waseda.enixer.exbnf.exBNF.Exceptions ex) '''throws «FOR e : ex.exceptions»«IF !ex.exceptions.
		findFirst[].equals(e)»,«ENDIF» «e»«ENDFOR»'''

	def dispatch compile(LocalVars lv) '''locals «lv.body»'''

	def dispatch compile(RuleAction ra) '''«ra.atSymbol» «ra.name» «ra.body»'''

	def dispatch compile(RuleBlock rb) '''«rb.body.compile»'''

	def dispatch compile(RuleAltList ral) '''«FOR a : ral.alternatives»| «a.compile»«ENDFOR»'''

	def dispatch compile(LabeledAlt la) '''«la.body.compile»«IF la.poundSymbol != null» «la.poundSymbol»«la.label»«ENDIF»'''

	def dispatch compile(Alternative al) '''«IF al.options != null»«al.options.compile» «ENDIF»«FOR e : al.elements»«e.
		compile»«ENDFOR»'''

	def dispatch compile(Element el) '''«el.body.compile»«IF el.operator != null»«el.operator.compile»«ENDIF» '''

	def dispatch compile(Ebnf eb) '''«eb.body.compile»«IF eb.operator != null» «eb.operator.compile»«ENDIF»'''

	def dispatch compile(ActionElement ae) '''«ae.body»«IF ae.options != null»«ae.options.compile»«ENDIF»'''

	def dispatch compile(LabeledElement le) '''«le.name» «le.op» «le.body.compile»'''

	def dispatch compile(EbnfSuffix es) '''«es.operator»«IF es.nongreedy != null» «es.nongreedy»«ENDIF»'''

	def dispatch compile(Block bl) '''(«IF bl.colon != null»«IF bl.options != null»«bl.options.compile»«ENDIF»«FOR a : bl.
		actions» «a.compile»«ENDFOR»:«ENDIF» «bl.body.compile»)'''

	def dispatch compile(AltList al) '''«FOR a : al.alternatives» «a.compile» |«ENDFOR»'''

	def dispatch compile(Atom at) '''«at.body.compile»'''

	def dispatch compile(RuleRef rr) '''«IF rr.reference.body != null»«rr.reference.name»«ELSE»«rr.reference»«ENDIF»«rr.
		args»«IF rr.options != null»«rr.options.compile»«ENDIF»'''

	def dispatch compile(ElementOptions eo) '''«eo.begin»«FOR o : eo.options»«o.compile»,«ENDFOR»«eo.end»'''

	def dispatch compile(com.waseda.enixer.exbnf.exBNF.Range ra) '''«ra.from»..«ra.to»'''

	def dispatch compile(Terminal te) '''«IF te.reference != null»«te.reference.compile»«IF te.options != null»«te.
		options.compile»«ENDIF»«ELSE»«te.literal»«IF te.options != null»«te.options.compile»«ENDIF»«ENDIF»'''

	def dispatch compile(NotSet ns) '''~«ns.body.compile»'''

	def dispatch compile(BlockSet bs) '''(«FOR e : bs.elements»«e.compile» | «ENDFOR»)'''

	def dispatch compile(SetElement se) '''«IF se.tokenRef != null»«se.tokenRef»«ELSEIF se.stringLiteral != null»«se.stringLiteral»«ELSEIF se.
		range != null»«se.range»«ELSE»«se.charSet»«ENDIF»'''

	def dispatch compile(Wildcard wi) '''«wi.dot»«IF wi.options != null»«wi.options.compile»«ENDIF»'''

	def dispatch compile(ElementOption eo) '''«IF eo.qualifiedId != null»«eo.qualifiedId.compile»«ELSE»«eo.id» «eo.
		assign» «eo.value»«ENDIF»'''

	def dispatch compile(LexerRule lr) '''«IF lr.fragment»flagment «ENDIF»«lr.name»:«lr.body.compile»«lr.semicolonSymbol»'''

	def dispatch compile(LexerRuleBlock lrb) '''«lrb.body.compile»'''

	def dispatch compile(LexerAltList lal) '''«FOR a : lal.alternatives»«a.compile» | «ENDFOR»'''

	def dispatch compile(LexerAlt la) '''«la.body.compile» «IF la.commands != null»«la.commands.compile»«ENDIF»'''

	def dispatch compile(LexerElements le) '''«FOR e : le.elements»«e.compile»«ENDFOR»'''

	def dispatch compile(LexerElement le) '''«le.body.compile»«IF le.operator != null»«le.operator.compile»«ENDIF»'''

	def dispatch compile(LabeledLexerElement lle) '''«lle.label» «lle.op» «lle.body.compile»'''

	def dispatch compile(LexerAtom la) '''«la.body.compile»'''

	def dispatch compile(LexerCharSet lcs) '''«lcs.body»'''

	def dispatch compile(LexerBlock lb) '''(«IF lb.options != null»«lb.options» :«ENDIF»«lb.body.compile»)'''

	def dispatch compile(LexerCommands lc) '''«lc.keyword»«FOR c : lc.commands»«c.compile» | «ENDFOR»'''

	def dispatch compile(LexerCommand lc) '''«lc.name»«IF lc.args != null»(«lc.args.compile»)«ENDIF»'''

	def dispatch compile(LexerCommandExpr lce) '''«IF lce.ref != null»«lce.ref.compile»«ELSE»«lce.value»«ENDIF»'''

	def dispatch compile(QualifiedId qi) '''«FOR n : qi.name»«n».«ENDFOR»'''
}
