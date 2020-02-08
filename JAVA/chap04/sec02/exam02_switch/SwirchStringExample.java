package sec02.exam02_switch;

public class SwirchStringExample {

	public static void main(String[] args) {
		String position = "과장";
		
		switch(position) {
		case "부장":
			System.out.println("700");
			break;
		case "과장":
			System.out.println("600");
			break;
		default:
			System.out.println("400");
		}

	}

}
