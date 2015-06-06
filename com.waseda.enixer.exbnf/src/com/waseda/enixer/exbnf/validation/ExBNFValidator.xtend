/*
 * generated by Xtext
 */
package com.waseda.enixer.exbnf.validation

import org.eclipse.xtext.validation.Check
import com.waseda.enixer.exbnf.exBNF.*
import net.unicoen.node.UniNode

//import org.eclipse.xtext.validation.Check
/**
 * Custom validation rules. 
 * 
 * see http://www.eclipse.org/Xtext/documentation.html#validation
 */
class ExBNFValidator extends AbstractExBNFValidator {

	@Check
	def checkNodeMembers(ParserRule r) {
		val packagePrefix = UniNode.package.name + '.'
		val clazz = Class.forName(packagePrefix + r.type.list.bind)
		r.eAllContents.filter(ElementWithDollar).forEach [
			switch it.op {
				case "TODO": {
					val ruleName = ((it.body.body as Atom).body as RuleRef).reference.name
					warning('not Implemented: ' + ruleName + ' in ' + r.name, it,
						ExBNFPackage.Literals.ELEMENT_WITH_DOLLAR__OP)
				}
				case "ADD":
					return
				case "APPEND":
					return
				case "RETURN":
					return
				case "MERGE": {
					if (!r.type.list.bind.equals(it.referenceReturnType)) {
						val ruleName = ((it.body.body as Atom).body as RuleRef).reference.name
						val sb = new StringBuilder
						sb.append('Type mismatch: The return type of ').append(r.name).append(' is ').append(
							r.type.list.bind).append(' but The return type of ').append(ruleName).append(' is ').append(
							it.referenceReturnType).append('.')
							error(sb.toString, it,ExBNFPackage.Literals.ELEMENT_WITH_DOLLAR__BODY)
					}
				}
				default: {
					try {
						clazz.getField(it.op)
					} catch (NoSuchFieldException e) {
						val sb = new StringBuilder
						sb.append('Field ').append(it.op).append(' is not exist. The fields of class ').append(
							r.type.list.bind).append(' are')
						clazz.fields.forEach [
							sb.append(' ').append(it.name)
							if (it != clazz.fields.last) {
								sb.append(',')
							}
						]
						sb.append('.')
						error(sb.toString, it, ExBNFPackage.Literals.ELEMENT_WITH_DOLLAR__OP)
					}
				}
			}
		]
	}

	def getReferenceReturnType(ElementWithDollar r) {
		if (r.body.body instanceof Atom) {
			val atom = r.body.body as Atom
			if (atom.body instanceof RuleRef) {
				val ref = atom.body as RuleRef
				if (ref.reference.type != null) {
					ref.reference.type.list.bind
				}
			}
		}
	}

}
