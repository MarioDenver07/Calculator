package Calculator.stepFile;

import org.junit.Assert;
import org.openqa.selenium.*;
import cucumber.api.java.*;
import cucumber.api.java.en.*;
import Calculator.resources.WebdriveInitiate;
import Calculator.stepImplementation.CalculatorImplementation;

public class CalculatorStep {

	public String build;
	public WebDriver driver;
	public CalculatorImplementation calculatorActions;
	WebdriveInitiate driverSetup = new WebdriveInitiate();

	// Junit annotations
	@Before
	public void beforeScenario() {

		driver = driverSetup.initiateWebdriver();
		calculatorActions = new CalculatorImplementation(driver);
	}

	@After
	public void afterScenario() {
		driverSetup.closeDriver();
	}

	@Given("^I am on the \"([^\"]*)\" home page$")
	public void i_am_on_the_home_page(String url) throws Throwable {

		calculatorActions.navigateUrl(url);
	}

	@When("^I select build \"([^\"]*)\" from dropdown$")
	public void i_select_build_from_dropdown(String calcBuild) throws Throwable {
		build = calcBuild;
		calculatorActions.selectBuild(calcBuild);
	}

	@And("^I enter \"([^\"]*)\" and \"([^\"]*)\" in field$")
	public void i_enter_and_in_field(String number1, String number2) throws Throwable {
		calculatorActions.enterNumbers(number1, number2);
	}

	@And("^I select \"([^\"]*)\" from dropdown and check \"([^\"]*)\"$")
	public void i_select_from_dropdown_and_check(String operation, String integer) throws Throwable {

		calculatorActions.selectOperation(operation);
		calculatorActions.integerCheckBox(integer);
		calculatorActions.clickCalculate();
	}

	@Then("^I validate the \"([^\"]*)\" Answer field$")
	public void i_validate_the_Answer_field(String result) throws Throwable {
		Thread.sleep(1000);
		String actualResult;
		String expectedResult;
		actualResult = calculatorActions.getOutputvalue(result);

		calculatorActions.selectOperation("Prototype");
		calculatorActions.clickCalculate();

		expectedResult = calculatorActions.getOutputvalue(result);
		System.out.println("Expected Result: " + expectedResult + "\nActual Result: " + actualResult);
		Assert.assertEquals(expectedResult, actualResult);
	}

	@When("^I click on clear Button$")
	public void i_click_on_Button() throws Throwable {
		Thread.sleep(500);
		calculatorActions.selectOperation(build);
		Thread.sleep(500);
		calculatorActions.clearButton();
	}

	@Then("^All fields are erased$")
	public void all_fields_are_erased() throws Throwable {
		calculatorActions.validateClear();
	}

}
