/**
 */
package org.xtext.example.mydsl.myDsl.impl;

import java.util.Collection;

import org.eclipse.emf.common.notify.NotificationChain;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.InternalEObject;

import org.eclipse.emf.ecore.impl.MinimalEObjectImpl;

import org.eclipse.emf.ecore.util.EObjectContainmentEList;
import org.eclipse.emf.ecore.util.InternalEList;

import org.xtext.example.mydsl.myDsl.KeyConstr;
import org.xtext.example.mydsl.myDsl.MyDslPackage;
import org.xtext.example.mydsl.myDsl.RuleCall;
import org.xtext.example.mydsl.myDsl.Term;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Term</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * <ul>
 *   <li>{@link org.xtext.example.mydsl.myDsl.impl.TermImpl#getKConstr <em>KConstr</em>}</li>
 *   <li>{@link org.xtext.example.mydsl.myDsl.impl.TermImpl#getRCall <em>RCall</em>}</li>
 * </ul>
 * </p>
 *
 * @generated
 */
public class TermImpl extends MinimalEObjectImpl.Container implements Term
{
  /**
   * The cached value of the '{@link #getKConstr() <em>KConstr</em>}' containment reference list.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #getKConstr()
   * @generated
   * @ordered
   */
  protected EList<KeyConstr> kConstr;

  /**
   * The cached value of the '{@link #getRCall() <em>RCall</em>}' containment reference list.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see #getRCall()
   * @generated
   * @ordered
   */
  protected EList<RuleCall> rCall;

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  protected TermImpl()
  {
    super();
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  protected EClass eStaticClass()
  {
    return MyDslPackage.Literals.TERM;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EList<KeyConstr> getKConstr()
  {
    if (kConstr == null)
    {
      kConstr = new EObjectContainmentEList<KeyConstr>(KeyConstr.class, this, MyDslPackage.TERM__KCONSTR);
    }
    return kConstr;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public EList<RuleCall> getRCall()
  {
    if (rCall == null)
    {
      rCall = new EObjectContainmentEList<RuleCall>(RuleCall.class, this, MyDslPackage.TERM__RCALL);
    }
    return rCall;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public NotificationChain eInverseRemove(InternalEObject otherEnd, int featureID, NotificationChain msgs)
  {
    switch (featureID)
    {
      case MyDslPackage.TERM__KCONSTR:
        return ((InternalEList<?>)getKConstr()).basicRemove(otherEnd, msgs);
      case MyDslPackage.TERM__RCALL:
        return ((InternalEList<?>)getRCall()).basicRemove(otherEnd, msgs);
    }
    return super.eInverseRemove(otherEnd, featureID, msgs);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public Object eGet(int featureID, boolean resolve, boolean coreType)
  {
    switch (featureID)
    {
      case MyDslPackage.TERM__KCONSTR:
        return getKConstr();
      case MyDslPackage.TERM__RCALL:
        return getRCall();
    }
    return super.eGet(featureID, resolve, coreType);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @SuppressWarnings("unchecked")
  @Override
  public void eSet(int featureID, Object newValue)
  {
    switch (featureID)
    {
      case MyDslPackage.TERM__KCONSTR:
        getKConstr().clear();
        getKConstr().addAll((Collection<? extends KeyConstr>)newValue);
        return;
      case MyDslPackage.TERM__RCALL:
        getRCall().clear();
        getRCall().addAll((Collection<? extends RuleCall>)newValue);
        return;
    }
    super.eSet(featureID, newValue);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public void eUnset(int featureID)
  {
    switch (featureID)
    {
      case MyDslPackage.TERM__KCONSTR:
        getKConstr().clear();
        return;
      case MyDslPackage.TERM__RCALL:
        getRCall().clear();
        return;
    }
    super.eUnset(featureID);
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public boolean eIsSet(int featureID)
  {
    switch (featureID)
    {
      case MyDslPackage.TERM__KCONSTR:
        return kConstr != null && !kConstr.isEmpty();
      case MyDslPackage.TERM__RCALL:
        return rCall != null && !rCall.isEmpty();
    }
    return super.eIsSet(featureID);
  }

} //TermImpl
