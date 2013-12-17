/*
* generated by Xtext
*/
grammar InternalMyDsl;

options {
	superClass=AbstractInternalContentAssistParser;
	
}

@lexer::header {
package org.xtext.example.mydsl.ui.contentassist.antlr.internal;

// Hack: Use our own Lexer superclass by means of import. 
// Currently there is no other way to specify the superclass for the lexer.
import org.eclipse.xtext.ui.editor.contentassist.antlr.internal.Lexer;
}

@parser::header {
package org.xtext.example.mydsl.ui.contentassist.antlr.internal; 

import java.io.InputStream;
import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.ui.editor.contentassist.antlr.internal.AbstractInternalContentAssistParser;
import org.eclipse.xtext.ui.editor.contentassist.antlr.internal.DFA;
import org.xtext.example.mydsl.services.MyDslGrammarAccess;

}

@parser::members {
 
 	private MyDslGrammarAccess grammarAccess;
 	
    public void setGrammarAccess(MyDslGrammarAccess grammarAccess) {
    	this.grammarAccess = grammarAccess;
    }
    
    @Override
    protected Grammar getGrammar() {
    	return grammarAccess.getGrammar();
    }
    
    @Override
    protected String getValueForTokenName(String tokenName) {
    	return tokenName;
    }

}




// Entry rule entryRuleModel
entryRuleModel 
:
{ before(grammarAccess.getModelRule()); }
	 ruleModel
{ after(grammarAccess.getModelRule()); } 
	 EOF 
;

// Rule Model
ruleModel
    @init {
		int stackSize = keepStackSize();
    }
	:
(
(
{ before(grammarAccess.getModelAccess().getRulesAssignment()); }
(rule__Model__RulesAssignment)
{ after(grammarAccess.getModelAccess().getRulesAssignment()); }
)
(
{ before(grammarAccess.getModelAccess().getRulesAssignment()); }
(rule__Model__RulesAssignment)*
{ after(grammarAccess.getModelAccess().getRulesAssignment()); }
)
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleRule
entryRuleRule 
:
{ before(grammarAccess.getRuleRule()); }
	 ruleRule
{ after(grammarAccess.getRuleRule()); } 
	 EOF 
;

// Rule Rule
ruleRule
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getRuleAccess().getGroup()); }
(rule__Rule__Group__0)
{ after(grammarAccess.getRuleAccess().getGroup()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleExpression
entryRuleExpression 
:
{ before(grammarAccess.getExpressionRule()); }
	 ruleExpression
{ after(grammarAccess.getExpressionRule()); } 
	 EOF 
;

// Rule Expression
ruleExpression
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getExpressionAccess().getGroup()); }
(rule__Expression__Group__0)
{ after(grammarAccess.getExpressionAccess().getGroup()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleElement
entryRuleElement 
:
{ before(grammarAccess.getElementRule()); }
	 ruleElement
{ after(grammarAccess.getElementRule()); } 
	 EOF 
;

// Rule Element
ruleElement
    @init {
		int stackSize = keepStackSize();
    }
	:
(
(
{ before(grammarAccess.getElementAccess().getTermsAssignment()); }
(rule__Element__TermsAssignment)
{ after(grammarAccess.getElementAccess().getTermsAssignment()); }
)
(
{ before(grammarAccess.getElementAccess().getTermsAssignment()); }
(rule__Element__TermsAssignment)*
{ after(grammarAccess.getElementAccess().getTermsAssignment()); }
)
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleTerm
entryRuleTerm 
:
{ before(grammarAccess.getTermRule()); }
	 ruleTerm
{ after(grammarAccess.getTermRule()); } 
	 EOF 
;

// Rule Term
ruleTerm
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getTermAccess().getAlternatives()); }
(rule__Term__Alternatives)
{ after(grammarAccess.getTermAccess().getAlternatives()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleKeyConstr
entryRuleKeyConstr 
:
{ before(grammarAccess.getKeyConstrRule()); }
	 ruleKeyConstr
{ after(grammarAccess.getKeyConstrRule()); } 
	 EOF 
;

// Rule KeyConstr
ruleKeyConstr
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getKeyConstrAccess().getGroup()); }
(rule__KeyConstr__Group__0)
{ after(grammarAccess.getKeyConstrAccess().getGroup()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleKeyword
entryRuleKeyword 
:
{ before(grammarAccess.getKeywordRule()); }
	 ruleKeyword
{ after(grammarAccess.getKeywordRule()); } 
	 EOF 
;

// Rule Keyword
ruleKeyword
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getKeywordAccess().getTextAssignment()); }
(rule__Keyword__TextAssignment)
{ after(grammarAccess.getKeywordAccess().getTextAssignment()); }
)

;
finally {
	restoreStackSize(stackSize);
}



// Entry rule entryRuleRuleCall
entryRuleRuleCall 
:
{ before(grammarAccess.getRuleCallRule()); }
	 ruleRuleCall
{ after(grammarAccess.getRuleCallRule()); } 
	 EOF 
;

// Rule RuleCall
ruleRuleCall
    @init {
		int stackSize = keepStackSize();
    }
	:
(
{ before(grammarAccess.getRuleCallAccess().getGroup()); }
(rule__RuleCall__Group__0)
{ after(grammarAccess.getRuleCallAccess().getGroup()); }
)

;
finally {
	restoreStackSize(stackSize);
}




rule__Term__Alternatives
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getTermAccess().getKConstrAssignment_0()); }
(rule__Term__KConstrAssignment_0)
{ after(grammarAccess.getTermAccess().getKConstrAssignment_0()); }
)

    |(
{ before(grammarAccess.getTermAccess().getRCallAssignment_1()); }
(rule__Term__RCallAssignment_1)
{ after(grammarAccess.getTermAccess().getRCallAssignment_1()); }
)

;
finally {
	restoreStackSize(stackSize);
}



rule__Rule__Group__0
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Rule__Group__0__Impl
	rule__Rule__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Rule__Group__0__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getRuleAccess().getLessThanSignKeyword_0()); }

	'<' 

{ after(grammarAccess.getRuleAccess().getLessThanSignKeyword_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__Rule__Group__1
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Rule__Group__1__Impl
	rule__Rule__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__Rule__Group__1__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getRuleAccess().getNameAssignment_1()); }
(rule__Rule__NameAssignment_1)
{ after(grammarAccess.getRuleAccess().getNameAssignment_1()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__Rule__Group__2
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Rule__Group__2__Impl
	rule__Rule__Group__3
;
finally {
	restoreStackSize(stackSize);
}

rule__Rule__Group__2__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getRuleAccess().getGreaterThanSignKeyword_2()); }

	'>' 

{ after(grammarAccess.getRuleAccess().getGreaterThanSignKeyword_2()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__Rule__Group__3
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Rule__Group__3__Impl
	rule__Rule__Group__4
;
finally {
	restoreStackSize(stackSize);
}

rule__Rule__Group__3__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getRuleAccess().getColonColonEqualsSignKeyword_3()); }

	'::=' 

{ after(grammarAccess.getRuleAccess().getColonColonEqualsSignKeyword_3()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__Rule__Group__4
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Rule__Group__4__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Rule__Group__4__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getRuleAccess().getExpressionAssignment_4()); }
(rule__Rule__ExpressionAssignment_4)
{ after(grammarAccess.getRuleAccess().getExpressionAssignment_4()); }
)

;
finally {
	restoreStackSize(stackSize);
}












rule__Expression__Group__0
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Expression__Group__0__Impl
	rule__Expression__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Expression__Group__0__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getExpressionAccess().getElementsAssignment_0()); }
(rule__Expression__ElementsAssignment_0)
{ after(grammarAccess.getExpressionAccess().getElementsAssignment_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__Expression__Group__1
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Expression__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Expression__Group__1__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getExpressionAccess().getGroup_1()); }
(rule__Expression__Group_1__0)*
{ after(grammarAccess.getExpressionAccess().getGroup_1()); }
)

;
finally {
	restoreStackSize(stackSize);
}






rule__Expression__Group_1__0
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Expression__Group_1__0__Impl
	rule__Expression__Group_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__Expression__Group_1__0__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getExpressionAccess().getVerticalLineKeyword_1_0()); }

	'|' 

{ after(grammarAccess.getExpressionAccess().getVerticalLineKeyword_1_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__Expression__Group_1__1
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__Expression__Group_1__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__Expression__Group_1__1__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getExpressionAccess().getElementsAssignment_1_1()); }
(rule__Expression__ElementsAssignment_1_1)
{ after(grammarAccess.getExpressionAccess().getElementsAssignment_1_1()); }
)

;
finally {
	restoreStackSize(stackSize);
}






rule__KeyConstr__Group__0
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__KeyConstr__Group__0__Impl
	rule__KeyConstr__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__KeyConstr__Group__0__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getKeyConstrAccess().getKWordAssignment_0()); }
(rule__KeyConstr__KWordAssignment_0)
{ after(grammarAccess.getKeyConstrAccess().getKWordAssignment_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__KeyConstr__Group__1
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__KeyConstr__Group__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__KeyConstr__Group__1__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getKeyConstrAccess().getGroup_1()); }
(rule__KeyConstr__Group_1__0)?
{ after(grammarAccess.getKeyConstrAccess().getGroup_1()); }
)

;
finally {
	restoreStackSize(stackSize);
}






rule__KeyConstr__Group_1__0
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__KeyConstr__Group_1__0__Impl
	rule__KeyConstr__Group_1__1
;
finally {
	restoreStackSize(stackSize);
}

rule__KeyConstr__Group_1__0__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getKeyConstrAccess().getFullStopFullStopKeyword_1_0()); }

	'..' 

{ after(grammarAccess.getKeyConstrAccess().getFullStopFullStopKeyword_1_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__KeyConstr__Group_1__1
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__KeyConstr__Group_1__1__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__KeyConstr__Group_1__1__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getKeyConstrAccess().getKWordAssignment_1_1()); }
(rule__KeyConstr__KWordAssignment_1_1)
{ after(grammarAccess.getKeyConstrAccess().getKWordAssignment_1_1()); }
)

;
finally {
	restoreStackSize(stackSize);
}






rule__RuleCall__Group__0
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__RuleCall__Group__0__Impl
	rule__RuleCall__Group__1
;
finally {
	restoreStackSize(stackSize);
}

rule__RuleCall__Group__0__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getRuleCallAccess().getLessThanSignKeyword_0()); }

	'<' 

{ after(grammarAccess.getRuleCallAccess().getLessThanSignKeyword_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__RuleCall__Group__1
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__RuleCall__Group__1__Impl
	rule__RuleCall__Group__2
;
finally {
	restoreStackSize(stackSize);
}

rule__RuleCall__Group__1__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getRuleCallAccess().getRefAssignment_1()); }
(rule__RuleCall__RefAssignment_1)
{ after(grammarAccess.getRuleCallAccess().getRefAssignment_1()); }
)

;
finally {
	restoreStackSize(stackSize);
}


rule__RuleCall__Group__2
    @init {
		int stackSize = keepStackSize();
    }
:
	rule__RuleCall__Group__2__Impl
;
finally {
	restoreStackSize(stackSize);
}

rule__RuleCall__Group__2__Impl
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getRuleCallAccess().getGreaterThanSignKeyword_2()); }

	'>' 

{ after(grammarAccess.getRuleCallAccess().getGreaterThanSignKeyword_2()); }
)

;
finally {
	restoreStackSize(stackSize);
}









rule__Model__RulesAssignment
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getModelAccess().getRulesRuleParserRuleCall_0()); }
	ruleRule{ after(grammarAccess.getModelAccess().getRulesRuleParserRuleCall_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__Rule__NameAssignment_1
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getRuleAccess().getNameIDTerminalRuleCall_1_0()); }
	RULE_ID{ after(grammarAccess.getRuleAccess().getNameIDTerminalRuleCall_1_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__Rule__ExpressionAssignment_4
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getRuleAccess().getExpressionExpressionParserRuleCall_4_0()); }
	ruleExpression{ after(grammarAccess.getRuleAccess().getExpressionExpressionParserRuleCall_4_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__Expression__ElementsAssignment_0
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getExpressionAccess().getElementsElementParserRuleCall_0_0()); }
	ruleElement{ after(grammarAccess.getExpressionAccess().getElementsElementParserRuleCall_0_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__Expression__ElementsAssignment_1_1
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getExpressionAccess().getElementsElementParserRuleCall_1_1_0()); }
	ruleElement{ after(grammarAccess.getExpressionAccess().getElementsElementParserRuleCall_1_1_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__Element__TermsAssignment
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getElementAccess().getTermsTermParserRuleCall_0()); }
	ruleTerm{ after(grammarAccess.getElementAccess().getTermsTermParserRuleCall_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__Term__KConstrAssignment_0
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getTermAccess().getKConstrKeyConstrParserRuleCall_0_0()); }
	ruleKeyConstr{ after(grammarAccess.getTermAccess().getKConstrKeyConstrParserRuleCall_0_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__Term__RCallAssignment_1
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getTermAccess().getRCallRuleCallParserRuleCall_1_0()); }
	ruleRuleCall{ after(grammarAccess.getTermAccess().getRCallRuleCallParserRuleCall_1_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__KeyConstr__KWordAssignment_0
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getKeyConstrAccess().getKWordKeywordParserRuleCall_0_0()); }
	ruleKeyword{ after(grammarAccess.getKeyConstrAccess().getKWordKeywordParserRuleCall_0_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__KeyConstr__KWordAssignment_1_1
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getKeyConstrAccess().getKWordKeywordParserRuleCall_1_1_0()); }
	ruleKeyword{ after(grammarAccess.getKeyConstrAccess().getKWordKeywordParserRuleCall_1_1_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__Keyword__TextAssignment
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getKeywordAccess().getTextSTRINGTerminalRuleCall_0()); }
	RULE_STRING{ after(grammarAccess.getKeywordAccess().getTextSTRINGTerminalRuleCall_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}

rule__RuleCall__RefAssignment_1
    @init {
		int stackSize = keepStackSize();
    }
:
(
{ before(grammarAccess.getRuleCallAccess().getRefRuleCrossReference_1_0()); }
(
{ before(grammarAccess.getRuleCallAccess().getRefRuleIDTerminalRuleCall_1_0_1()); }
	RULE_ID{ after(grammarAccess.getRuleCallAccess().getRefRuleIDTerminalRuleCall_1_0_1()); }
)
{ after(grammarAccess.getRuleCallAccess().getRefRuleCrossReference_1_0()); }
)

;
finally {
	restoreStackSize(stackSize);
}


RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

RULE_INT : ('0'..'9')+;

RULE_STRING : ('"' ('\\' ('b'|'t'|'n'|'f'|'r'|'u'|'"'|'\''|'\\')|~(('\\'|'"')))* '"'|'\'' ('\\' ('b'|'t'|'n'|'f'|'r'|'u'|'"'|'\''|'\\')|~(('\\'|'\'')))* '\'');

RULE_ML_COMMENT : '/*' ( options {greedy=false;} : . )*'*/';

RULE_SL_COMMENT : '//' ~(('\n'|'\r'))* ('\r'? '\n')?;

RULE_WS : (' '|'\t'|'\r'|'\n')+;

RULE_ANY_OTHER : .;


