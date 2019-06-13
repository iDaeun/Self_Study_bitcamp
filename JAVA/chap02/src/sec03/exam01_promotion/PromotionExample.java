package sec03.exam01_promotion;

public class PromotionExample {

	public static void main(String[] args) {


		byte byteValue = 10;
		int intValue = byteValue;
		
		System.out.println(intValue);

		char charValue = '°¡';
		intValue = charValue;
		System.out.println(intValue);
		
		intValue = 500;
		long longValue = intValue;
		System.out.println(longValue);
		
		intValue = 200;
		double doubleValue = intValue;
		System.out.println(doubleValue);
		
		longValue = 100000000L;
		float floatValue = longValue;
		System.out.println(floatValue);
	}

}
