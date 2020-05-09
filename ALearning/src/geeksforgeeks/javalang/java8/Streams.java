/**
 * 
 */
package geeksforgeeks.javalang.java8;

import java.util.Arrays;
import java.util.List;

/**
 * @author rahul.kumar
 *
 */
public class Streams {

	/**
	 * @param args
	 */
	static {
		System.out.println("Inside static block");
	}

	public static void main(String[] args) {
		List<String> list = Arrays.asList("1", "2", "3");
		list.stream().filter(i -> i.startsWith("1")).map((i) -> i + "1").mapToDouble((x) -> Math.sin(Long.valueOf(x)))
				.forEach(i -> System.out.println(i));

		System.out.println("Hello");
		// Runtime.getRuntime().exit(0);
		System.out.println("Word");

		Runtime.getRuntime().addShutdownHook(new Thread() {
			public void run() {
				// System.exit(0); // It won't work in side shutdown hook
				System.out.println("Inside addShutdownHook");
			}
		});
		System.out.println("Word");
	}

}
