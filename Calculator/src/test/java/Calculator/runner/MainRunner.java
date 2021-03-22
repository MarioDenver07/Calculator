package Calculator.runner;

import org.junit.runner.RunWith;

import cucumber.api.junit.Cucumber;
import cucumber.api.CucumberOptions;

@RunWith(Cucumber.class)

@CucumberOptions(features = { "src/test/java/Calculator/featureFiles/" }, glue = { "Calculator.stepFile" },
		tags = {"@all"},// @smoke @goodToHave @all @Concatenate 
						 //@Division @Multiplication @Subtract @Add
		
		plugin = { "pretty", "html:target/cucumber", "json:target/cucumber.json",
				"com.cucumber.listener.ExtentCucumberFormatter:target/report.html" }, monochrome = true)
public class MainRunner {

}
