package examples.misc;


import java.util.HashMap;
import java.util.Map;

public class JavaDemo {

	public Map<String, Object> doWork(String fromJs) {
		Map<String, Object> map = new HashMap<>();
		map.put("someKey", "hello " + fromJs);
		return map;
	}

	public static String doWorkStatic(String fromJs) {
		return "hello " + fromJs;
	}
}
