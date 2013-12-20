/*
 * generated by Xtext
 */
package org.xtext.example.mydsl.generator

import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.IGenerator
import org.eclipse.xtext.generator.IFileSystemAccess

import org.xtext.example.mydsl.myDsl.Rule
import org.xtext.example.mydsl.myDsl.Model
import org.xtext.example.mydsl.myDsl.Expression

class MyDslGenerator implements IGenerator {

	override void doGenerate(Resource resource, IFileSystemAccess fsa) {
		for (m : resource.allContents.toIterable.filter(Model)) {
			fsa.generateFile("model.g", m.compile)
		}
	}

	def compile(Model m) '''
	grammar CSV;
			
	«FOR r : m.rules»«r.compile»«ENDFOR»'''

	def compile(Rule r) '''«r.name»:
	«r.expression.compile»;
	'''

	def compile(Expression exp) '''«FOR ele : exp.elements»«FOR t : ele.terms»«FOR r : t.RCall»«IF !exp.elements.head.
		equals(ele) && ele.terms.head.equals(t)»| «ENDIF»«r.ref.name» «ENDFOR»«ENDFOR»«ENDFOR»'''
}
