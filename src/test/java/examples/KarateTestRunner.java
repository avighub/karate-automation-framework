package examples;

import com.intuit.karate.junit5.Karate;

public class KarateTestRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("classpath:examples").relativeTo(getClass());
    }
    @Karate.Test
    Karate testTags() {
        return Karate.run("tags").tags("@second").relativeTo(getClass());
    }

    @Karate.Test
    Karate testSystemProperty() {
        return Karate.run("classpath:examples")
                .tags("@second")
                .karateEnv("e2e")
                .systemProperty("foo", "bar");
    }
}
