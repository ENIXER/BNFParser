/*
* generated by Xtext
*/
package com.waseda.enixer.exbnf;

/**
 * Initialization support for running Xtext languages 
 * without equinox extension registry
 */
public class ExBNFStandaloneSetup extends ExBNFStandaloneSetupGenerated{

	public static void doSetup() {
		new ExBNFStandaloneSetup().createInjectorAndDoEMFRegistration();
	}
}
