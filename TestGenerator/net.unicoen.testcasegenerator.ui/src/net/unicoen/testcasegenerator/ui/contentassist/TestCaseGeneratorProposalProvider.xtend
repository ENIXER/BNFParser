/*
 * generated by Xtext
 */
package net.unicoen.testcasegenerator.ui.contentassist

import net.unicoen.testcasegenerator.ui.contentassist.AbstractTestCaseGeneratorProposalProvider
import org.eclipse.emf.ecore.EObject
import org.eclipse.xtext.Assignment
import org.eclipse.xtext.ui.editor.contentassist.ContentAssistContext
import org.eclipse.xtext.ui.editor.contentassist.ICompletionProposalAcceptor
import net.unicoen.testcasegenerator.testCaseGenerator.NodeArchitecture

/**
 * see http://www.eclipse.org/Xtext/documentation.html#contentAssist on how to customize content assistant
 */
class TestCaseGeneratorProposalProvider extends AbstractTestCaseGeneratorProposalProvider {
	override completeNodeArchitecture_NodeType(EObject model, Assignment assignment, ContentAssistContext context,
		ICompletionProposalAcceptor acceptor) {
		acceptor.accept(createCompletionProposal("UniArg", context))
		acceptor.accept(createCompletionProposal("UniArray", context))
		acceptor.accept(createCompletionProposal("UniBinOp", context))
		acceptor.accept(createCompletionProposal("UniBlock", context))
		acceptor.accept(createCompletionProposal("UniBoolLiteral", context))
		acceptor.accept(createCompletionProposal("UniBreak", context))
		acceptor.accept(createCompletionProposal("UniClassDec", context))
		acceptor.accept(createCompletionProposal("UniContinue", context))
		acceptor.accept(createCompletionProposal("UniDoubleLiteral", context))
		acceptor.accept(createCompletionProposal("UniDoWhile", context))
		acceptor.accept(createCompletionProposal("UniExpr", context))
		acceptor.accept(createCompletionProposal("UniFieldAccess", context))
		acceptor.accept(createCompletionProposal("UniFieldDec", context))
		acceptor.accept(createCompletionProposal("UniFor", context))
		acceptor.accept(createCompletionProposal("UniIdent", context))
		acceptor.accept(createCompletionProposal("UniIf", context))
		acceptor.accept(createCompletionProposal("UniIntLiteral", context))
		acceptor.accept(createCompletionProposal("UniLongLiteral", context))
		acceptor.accept(createCompletionProposal("UniMemberDec", context))
		acceptor.accept(createCompletionProposal("UniMethodCall", context))
		acceptor.accept(createCompletionProposal("UniMethodDec", context))
		acceptor.accept(createCompletionProposal("UniNew", context))
		acceptor.accept(createCompletionProposal("UniNewArray", context))
		acceptor.accept(createCompletionProposal("UniNode", context))
		acceptor.accept(createCompletionProposal("UniReturn", context))
		acceptor.accept(createCompletionProposal("UniStringLiteral", context))
		acceptor.accept(createCompletionProposal("UniTernaryOp", context))
		acceptor.accept(createCompletionProposal("UniUnaryOp", context))
		acceptor.accept(createCompletionProposal("UniVariableDec", context))
		acceptor.accept(createCompletionProposal("UniWhile", context))
	}

	override completeChildDeclaration_FieldName(EObject model, Assignment assignment, ContentAssistContext context,
		ICompletionProposalAcceptor acceptor) {
		val cls = Class.forName("net.unicoen.node." + (model as NodeArchitecture).nodeType)
		cls.fields.forEach[acceptor.accept(createCompletionProposal(it.name, context))]
	}

}
