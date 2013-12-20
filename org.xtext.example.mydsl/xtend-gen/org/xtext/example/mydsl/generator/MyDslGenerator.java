/**
 * generated by Xtext
 */
package org.xtext.example.mydsl.generator;

import com.google.common.collect.Iterables;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.common.util.TreeIterator;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.xtend2.lib.StringConcatenation;
import org.eclipse.xtext.generator.IFileSystemAccess;
import org.eclipse.xtext.generator.IGenerator;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.IteratorExtensions;
import org.xtext.example.mydsl.myDsl.Element;
import org.xtext.example.mydsl.myDsl.Expression;
import org.xtext.example.mydsl.myDsl.Model;
import org.xtext.example.mydsl.myDsl.Rule;
import org.xtext.example.mydsl.myDsl.RuleCall;
import org.xtext.example.mydsl.myDsl.Term;

@SuppressWarnings("all")
public class MyDslGenerator implements IGenerator {
  public void doGenerate(final Resource resource, final IFileSystemAccess fsa) {
    TreeIterator<EObject> _allContents = resource.getAllContents();
    Iterable<EObject> _iterable = IteratorExtensions.<EObject>toIterable(_allContents);
    Iterable<Model> _filter = Iterables.<Model>filter(_iterable, Model.class);
    for (final Model m : _filter) {
      CharSequence _compile = this.compile(m);
      fsa.generateFile("model.g", _compile);
    }
  }
  
  public CharSequence compile(final Model m) {
    StringConcatenation _builder = new StringConcatenation();
    _builder.append("grammar CSV;");
    _builder.newLine();
    _builder.append("\t\t");
    _builder.newLine();
    {
      EList<Rule> _rules = m.getRules();
      for(final Rule r : _rules) {
        CharSequence _compile = this.compile(r);
        _builder.append(_compile, "");
      }
    }
    return _builder;
  }
  
  public CharSequence compile(final Rule r) {
    StringConcatenation _builder = new StringConcatenation();
    String _name = r.getName();
    _builder.append(_name, "");
    _builder.append(":");
    _builder.newLineIfNotEmpty();
    _builder.append("\t");
    Expression _expression = r.getExpression();
    CharSequence _compile = this.compile(_expression);
    _builder.append(_compile, "	");
    _builder.append(";");
    _builder.newLineIfNotEmpty();
    return _builder;
  }
  
  public CharSequence compile(final Expression exp) {
    StringConcatenation _builder = new StringConcatenation();
    {
      EList<Element> _elements = exp.getElements();
      for(final Element ele : _elements) {
        {
          EList<Term> _terms = ele.getTerms();
          for(final Term t : _terms) {
            {
              EList<RuleCall> _rCall = t.getRCall();
              for(final RuleCall r : _rCall) {
                {
                  boolean _and = false;
                  EList<Element> _elements_1 = exp.getElements();
                  Element _head = IterableExtensions.<Element>head(_elements_1);
                  boolean _equals = _head.equals(ele);
                  boolean _not = (!_equals);
                  if (!_not) {
                    _and = false;
                  } else {
                    EList<Term> _terms_1 = ele.getTerms();
                    Term _head_1 = IterableExtensions.<Term>head(_terms_1);
                    boolean _equals_1 = _head_1.equals(t);
                    _and = (_not && _equals_1);
                  }
                  if (_and) {
                    _builder.append("| ");
                  }
                }
                Rule _ref = r.getRef();
                String _name = _ref.getName();
                _builder.append(_name, "");
                _builder.append(" ");
              }
            }
          }
        }
      }
    }
    return _builder;
  }
}