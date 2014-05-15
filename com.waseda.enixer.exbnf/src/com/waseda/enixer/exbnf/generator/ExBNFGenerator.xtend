/*
 * generated by Xtext
 */
package com.waseda.enixer.exbnf.generator

import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.IGenerator
import org.eclipse.xtext.generator.IFileSystemAccess

import com.waseda.enixer.exbnf.exBNF.Rule
import com.waseda.enixer.exbnf.exBNF.Expression
import com.waseda.enixer.exbnf.exBNF.Model

class MyDslGenerator implements IGenerator {

	override void doGenerate(Resource resource, IFileSystemAccess fsa) {
		for (m : resource.allContents.toIterable.filter(Model)) {
			fsa.generateFile(m.gram.gname.toUpperCaseOnlyFirst + ".g4", m.compile)
			fsa.generateFile("CountElements" + m.gram.gname.toUpperCaseOnlyFirst + ".dat", m.exportExtractElements)
			fsa.generateFile("Main" + m.gram.gname.toUpperCaseOnlyFirst + ".java", m.mainCompile);
			fsa.generateFile(m.gram.gname.toUpperCaseOnlyFirst + "Extractor.java", m.listenerCompile);
		}
	}

	def compile(Model m) '''
	grammar «m.gram.gname.toUpperCaseOnlyFirst»;
	
	«FOR r : m.rules»«IF Character.isLowerCase(r.name.charAt(0))»«r.acompile»«ENDIF»«ENDFOR»
	
	«FOR r : m.rules»«IF Character.isUpperCase(r.name.charAt(0))»«r.bcompile»«ENDIF»«ENDFOR»
	
	Whitespace:
		[ \r\n\t] -> skip;'''

	def acompile(Rule r) '''«r.name»:
	«r.expression.acompile»;
	'''

	def acompile(Expression exp) '''«FOR ele : exp.elements»«FOR t : ele.terms»«FOR r : t.RCall»«IF !exp.elements.head.
		equals(ele) && ele.terms.head.equals(t)»| «ENDIF»«r.ref.name» «ENDFOR»«ENDFOR»«ENDFOR»'''

	def bcompile(Rule r) '''«r.name»:
	«r.expression.bcompile»;
	'''

	def bcompile(Expression exp) '''«FOR ele : exp.elements»«FOR t : ele.terms»«FOR k : t.KConstr»«IF !exp.elements.head.
		equals(ele) && ele.terms.head.equals(t)»| «ENDIF»'«k.SChar»' «IF !k.EChar.nullOrEmpty».. '«k.EChar»' «ENDIF»«ENDFOR»«ENDFOR»«ENDFOR»'''

	def exportExtractElements(Model m) '''«FOR r : m.rules»«IF !r.count.nullOrEmpty»«r.name»
«ENDIF»«ENDFOR»'''

	def toUpperCaseOnlyFirst(String s) {
		s.substring(0, 1).toUpperCase + s.substring(1).toLowerCase;
	}

	def mainCompile(Model m) '''package com.sample;

import java.util.Arrays;

import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import parser.«m.gram.gname.toUpperCaseOnlyFirst»Lexer;
import parser.«m.gram.gname.toUpperCaseOnlyFirst»Parser;

public class Main«m.gram.gname.toUpperCaseOnlyFirst» {

	public static void main(String[] args) {
		String code = "int m(v){int a = 0; if(i==0) a++;}";
		CharStream input = new ANTLRInputStream(code);
		«m.gram.gname.toUpperCaseOnlyFirst»Lexer lexer = new «m.gram.gname.toUpperCaseOnlyFirst»Lexer(input);
		CommonTokenStream tokens = new CommonTokenStream(lexer);
		«m.gram.gname.toUpperCaseOnlyFirst»Parser parser = new «m.gram.gname.toUpperCaseOnlyFirst»Parser(tokens);
		ParseTreeWalker walker = new ParseTreeWalker();

		«m.gram.gname.toUpperCaseOnlyFirst»Extractor extractor = new «m.gram.gname.toUpperCaseOnlyFirst»Extractor(parser);

		// Parse code and generate a parse tree
		ParserRuleContext tree = parser.translation_unit();

		// Scan the parse tree
		walker.walk(myListener, tree);

		// Show token counts
		myListener.showTokenCounts();

		// Show Complexity
		myListener.showCyclomaticComplexity();
	}
}
	
	'''

	def listenerCompile(Model m) '''package com.sample;

import java.io.*;
import java.util.*;
import java.util.Map.Entry;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.TerminalNode;

import parser.«m.gram.gname.toUpperCaseOnlyFirst»BaseListener;
import parser.«m.gram.gname.toUpperCaseOnlyFirst»Lexer;
import parser.«m.gram.gname.toUpperCaseOnlyFirst»Parser;

public class «m.gram.gname.toUpperCaseOnlyFirst»Extractor extends «m.gram.gname.toUpperCaseOnlyFirst»BaseListener {
	private «m.gram.gname.toUpperCaseOnlyFirst»Parser _parser;
	private HashMap<String, Integer> _map;
	private Set<String> extractElementSet;

	public «m.gram.gname.toUpperCaseOnlyFirst»Extractor(«m.gram.gname.toUpperCaseOnlyFirst»Parser parser) {
		_parser = parser;
		_map = new HashMap<String, Integer>();
		extractElementSet = new HashSet<String>();
		File countElementsFile = new File("dat\\CountElements«m.gram.gname.toUpperCaseOnlyFirst».dat");
		«FOR r:m.rules»«IF !r.count.nullOrEmpty»extractElementSet.add("«r.name»");
		«ENDIF»«ENDFOR»
	}

	public void showTokenCounts() {
		System.out.println("*** showTokenCounts ***");
		for (Entry<String, Integer> nameAndCount : _map.entrySet()) {
			String name = nameAndCount.getKey();
			int count = nameAndCount.getValue();
			System.out.println(name + ": " + count);
		}
	}

	public void showCyclomaticComplexity() {
		System.out.println("*** showCyclomaticComplexity ***");
		int result = 1;
		for (Entry<String, Integer> nameAndCount : _map.entrySet()) {
			result += nameAndCount.getValue();
		}
		System.out.println("Cyclomatic Complexity : " + result);
	}

	@Override
	public void visitTerminal(TerminalNode node) {
		Token token = node.getSymbol();
		String tokenName = «m.gram.gname.toUpperCaseOnlyFirst»Lexer.ruleNames[token.getType() - 1];
		if (extractElementSet.contains(tokenName)) {
			System.out.println("*** visitTerminal ***");
			System.out.println(tokenName + ": " + token.getText());

			// Count tokens
			Integer value = _map.get(tokenName);
			value = value == null ? 0 : value;
			_map.put(tokenName, value + 1);
		}
	}

	@Override
	public void enterEveryRule(ParserRuleContext ctx) {
		String ruleName = «m.gram.gname.toUpperCaseOnlyFirst»Parser.ruleNames[ctx.getRuleIndex()];
		if (extractElementSet.contains(ruleName)) {
			System.out.println("*** visitRule ***");
			System.out.println(ruleName + ": " + ctx.getText());

			Integer value = _map.get(ruleName);
			value = value == null ? 0 : value;
			_map.put(ruleName, value + 1);
		}
	}
}
	
	'''
}
