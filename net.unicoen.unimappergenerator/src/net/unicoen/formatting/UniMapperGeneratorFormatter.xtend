/*
 * generated by Xtext
 */
package net.unicoen.formatting

import org.eclipse.xtext.formatting.impl.AbstractDeclarativeFormatter
import org.eclipse.xtext.formatting.impl.FormattingConfig
import net.unicoen.services.UniMapperGeneratorGrammarAccess
import com.google.inject.Inject

// import com.google.inject.Inject;
// import net.unicoen.services.UniMapperGeneratorGrammarAccess
/**
 * This class contains custom formatting declarations.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#formatting
 * on how and when to use it.
 * 
 * Also see {@link org.eclipse.xtext.xtext.XtextFormattingTokenSerializer} as an example
 */
class UniMapperGeneratorFormatter extends AbstractDeclarativeFormatter {

	@Inject extension UniMapperGeneratorGrammarAccess UniMapperGeneratorGrammarAccess

	override protected void configureFormatting(FormattingConfig c) {

		// It's usually a good idea to activate the following three statements.
		// They will add and preserve newlines around comments
		c.setLinewrap(0, 1, 2).before(SL_COMMENTRule)
		c.setLinewrap(0, 1, 2).before(ML_COMMENTRule)
		c.setLinewrap(0, 1, 1).after(ML_COMMENTRule)

		c.setLinewrap(2, 2, 2).before(UniMapperGeneratorGrammarAccess.ruleRule)
		c.setLinewrap.after(UniMapperGeneratorGrammarAccess.labeledAltRule)
		c.setLinewrap.after(UniMapperGeneratorGrammarAccess.lexerAltRule)
		c.setLinewrap.around(UniMapperGeneratorGrammarAccess.rootSelectionRule)

		c.setLinewrap.after(UniMapperGeneratorGrammarAccess.COLONRule)
		c.setNoSpace.around(UniMapperGeneratorGrammarAccess.DOLLARRule)
		c.setNoSpace.before(UniMapperGeneratorGrammarAccess.ebnfSuffixRule)
		c.setNoSpace.before(UniMapperGeneratorGrammarAccess.COLONRule)
		c.setNoSpace.before(UniMapperGeneratorGrammarAccess.SEMICOLONRule)

		c.setIndentationIncrement.before(UniMapperGeneratorGrammarAccess.COLONRule)
		c.setIndentationDecrement.after(UniMapperGeneratorGrammarAccess.ruleRule)
	}
}
