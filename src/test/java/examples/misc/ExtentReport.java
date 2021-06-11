package examples.misc;

import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.ExtentTest;
import com.aventstack.extentreports.reporter.KlovReporter;
import org.testng.annotations.BeforeClass;

public class ExtentReport {

	@BeforeClass
	public void setup () {
//		 driver = new ChromeDriver();
//		   driver.manage().window().maximize();
		 
//		   driver.navigate().to("http://www.swtestacademy.com");
		//ExtentHtmlReporter htmlReporter; //
		KlovReporter reporterKlov;
		ExtentReports      extent;       //
		ExtentTest         testReport;   // 
		   KlovReporter klovReporter = new KlovReporter();
		 
		   klovReporter.initMongoDbConnection("10.179.200.66", 27017);
		 
		   klovReporter.setProjectName("SDK");
		 
		   klovReporter.setReportName("V1.56");
		 
		   klovReporter.setKlovUrl("http://10.179.200.66");
		 
		   extent = new ExtentReports();
		   extent.attachReporter(klovReporter);
	}
	
	 
	
}
