package examples.misc;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.junit.Assert.assertTrue;

@KarateOptions(tags = {"~@ignore"}) // important: do not use @RunWith(Karate.class) !
public class CucumberRunner {
	
//	@BeforeClass
    public static void beforeClass() throws Exception {        
//        TestBase.beforeClass();
    }
	
	@Test
    public void testParallel() {
        System.setProperty("karate.env", "sqe"); // ensure reset if other tests (e.g. mock) had set env in CI
        Results results = Runner.parallel(getClass(), 5);
        generateReport(results.getReportDir());
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);        
    }
	
	public static void generateReport(String karateOutputPath) {        
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "Terms and Conditions - API");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();        
    }
	
}