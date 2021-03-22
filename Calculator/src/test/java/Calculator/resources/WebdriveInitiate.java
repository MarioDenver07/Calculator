package Calculator.resources;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;

public class WebdriveInitiate {

	public WebDriver driver;
	
	public WebDriver initiateWebdriver() {
		System.out.println("-----------------Start of Scenario-----------------");
		System.setProperty("webdriver.chrome.driver",
				"C:\\Users\\Mario Denver\\Desktop\\Eclipse\\Cucumber\\"
				+ "Calculator\\src\\test\\java\\Calculator\\resources\\chromedriver.exe");
		driver = new ChromeDriver();
		driver.manage().window().maximize();
		driver.manage().timeouts().pageLoadTimeout(30, TimeUnit.SECONDS);
		driver.manage().timeouts().setScriptTimeout(30, TimeUnit.SECONDS);
		return driver;
	}
	
	public void closeDriver() {
		driver.manage().deleteAllCookies();
		driver.quit();
		driver = null;
	}
	
	

	
}
