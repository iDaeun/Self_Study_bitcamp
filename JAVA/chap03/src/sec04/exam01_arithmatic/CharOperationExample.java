package sec04.exam01_arithmatic;

public class CharOperationExample {

	public static void main(String[] args) {
		char c1 = 'A' + 1;
		System.out.println(c1);
		char c2 = 'A';
		//char c3 = c2 + 1;
		int result = c2 + 1;
		System.out.println(result);
		
		char c3 = (char) result;
		System.out.println(c3);
	}

}
