package sec06.exam02_field_default_value;

public class FieldInitValueExample {

	public static void main(String[] args) {
		FieldInitValue fiv = new FieldInitValue();
		
		System.out.println("byteField: " + fiv.byteField);
		System.out.println(fiv.shortField);
		System.out.println(fiv.intField);
		System.out.println(fiv.longField);
		System.out.println(fiv.booleanField);
		System.out.println(fiv.charField);
		System.out.println(fiv.floatField);
		System.out.println(fiv.doubleField);
		System.out.println(fiv.arrField);
		System.out.println(fiv.referencesField);
	}

}
