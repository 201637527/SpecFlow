﻿Feature: External Step Definitions
	In order to modularize my solution
	As a bdd enthusiast
	I want to use step definitions from other assemblies
	
Scenario: Steps can defined in an external .NET (e.g. c# or VB.NET) project
	Given there is an external class library project 'ExternalSteps'
	And the following step definition in the project 'ExternalSteps'
        """
		[When(@"I do something")]
		public void WhenIDoSomething()
		{
		}
        """
	And there is a SpecFlow project with a reference to the project 'ExternalSteps'
	And a scenario 'Simple Scenario' as
         """
         When I do something
         """
	And the specflow configuration is
        """
		<specFlow>                             
			<stepAssemblies>                         
				<stepAssembly assembly="ExternalSteps" />    
			</stepAssemblies>                   
            <unitTestProvider name="xunit" />
		</specFlow>
        """
	When I execute the tests
	Then all tests should pass

@fsharp
Scenario: Steps can defined in an external F# project
	Given there is an external F# class library project 'ExternalSteps_FSharp'
	And the following binding class in the project 'ExternalSteps_FSharp'
        """
		let [<TechTalk.SpecFlow.When>] ``I do something``() = ()
        """
	And there is a SpecFlow project with a reference to the project 'ExternalSteps_FSharp'
	And a scenario 'Simple Scenario' as
         """
         When I do something
         """
	And the specflow configuration is
        """
		<specFlow>                             
			<stepAssemblies>
				<stepAssembly assembly="ExternalSteps_FSharp" />    
			</stepAssemblies>           
            <unitTestProvider name="xunit" />
		</specFlow>
        """
	When I execute the tests
	Then all tests should pass