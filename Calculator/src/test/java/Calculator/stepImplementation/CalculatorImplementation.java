package Calculator.stepImplementation;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

public class CalculatorImplementation {

	public WebDriver driver;
	public String operation;

	public CalculatorImplementation(WebDriver driver) {
		this.driver = driver;
	}

	// To intiate element locator
	public By numberField1 = By.xpath("//*[@id = 'number1Field']");
	public By numberField2 = By.xpath("//*[@id = 'number2Field']");
	public By integerCheckbox = By.xpath("//*[@id= 'integerSelect']");
	public By calculateButton = By.xpath("//*[@id='calculateButton']");
	public By errorField = By.xpath("//*[@id='errorMsgField']");
	public By answerField = By.xpath("//*[@id='numberAnswerField']");
	public By clearButton = By.xpath("//*[@id='clearButton']");

	/**
	 * this method is used to open URL and validate the page title
	 * 
	 * @param URL of the application
	 */
	public void navigateUrl(String url) {
		this.driver.get(url);
		Assert.assertEquals("Basic Calculator", driver.getTitle());
	}

	/**
	 * This method is used to select the respective build
	 * 
	 * @param calcBuild - calculator build
	 */
	public void selectBuild(String calcBuild) {
		this.driver.findElement(By.xpath("//option[text() = '" + calcBuild + "']")).click();
		System.out.println("Selected build " + calcBuild);
	}

	/**
	 * this method is used to enter number 1 and number 2 in field
	 * 
	 * @param number1
	 * @param number2
	 */
	public void enterNumbers(String number1, String number2) {
		this.driver.findElement(numberField1).sendKeys(number1);

		this.driver.findElement(numberField2).sendKeys(number2);

	}

	/**
	 * this method is used to select the operation to perform
	 * 
	 * @param operation
	 */
	public void selectOperation(String operation) {
		this.operation = operation;
		this.driver.findElement(By.xpath("//option[text() = '" + operation + "']")).click();
	}

	/**
	 * this method is used to check or uncheck integer checkbox pass yes in args to
	 * check pass no to uncheck
	 * 
	 * @param integer
	 */
	public void integerCheckBox(String integer) {

		if (!this.operation.equalsIgnoreCase("Concatenate")) {
			if (integer.equalsIgnoreCase("yes") && !this.driver.findElement(integerCheckbox).isSelected())
				this.driver.findElement(integerCheckbox).click();

			else if (integer.equalsIgnoreCase("no") && this.driver.findElement(integerCheckbox).isSelected())
				this.driver.findElement(integerCheckbox).click();
		}
	}

	/**
	 * this method is used to as an action to click calculate button
	 * 
	 * @throws Exception
	 */
	public void clickCalculate() throws Exception {
		Thread.sleep(1000);
		this.driver.findElement(calculateButton).click();
	}

	/**
	 * this method is used to get the output error message or value as string input
	 * args error or success
	 * 
	 * @param result
	 * @return Output value as String
	 */
	public String getOutputvalue(String result) {
		String outputValue;

		if (result.equalsIgnoreCase("Error"))
			outputValue = this.driver.findElement(By.xpath("//*[@id='errorMsgField']")).getText();
		else
			outputValue = this.driver.findElement(By.xpath("//*[@id='numberAnswerField']")).getAttribute("value");

		return outputValue;
	}

	/**
	 * this method is used to perform clear action
	 */
	public void clearButton() {
		this.driver.findElement(clearButton).click();
	}

	/**
	 * this method is used to check clear action
	 */
	public void validateClear() {
		Assert.assertEquals("", driver.findElement(answerField).getAttribute("value"));
	}

}
