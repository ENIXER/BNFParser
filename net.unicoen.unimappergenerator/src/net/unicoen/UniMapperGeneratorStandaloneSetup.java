/*
 * generated by Xtext
 */
package net.unicoen;

/**
 * Initialization support for running Xtext languages 
 * without equinox extension registry
 */
public class UniMapperGeneratorStandaloneSetup extends UniMapperGeneratorStandaloneSetupGenerated{

	public static void doSetup() {
		new UniMapperGeneratorStandaloneSetup().createInjectorAndDoEMFRegistration();
	}
}
