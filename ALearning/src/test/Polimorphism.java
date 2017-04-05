/**
 * 
 */
package test;

/**
 * @author rahul
 *
 */
public class Polimorphism {

	
	public static void main(String[] args) {
		Animal animal = new Cow();
		animal.printFood();
	}

}

class Animal {
	public void printFood() {
		System.out.println("Animal food...");
	}
}

class Cow extends Animal {
	public void printFood() {
		System.out.println("Cow food");
	}
}