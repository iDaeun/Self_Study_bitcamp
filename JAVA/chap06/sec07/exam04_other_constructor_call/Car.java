package sec07.exam04_other_constructor_call;

public class Car {
	String company = "현대자동차";
	String model;
	String color;
	int maxSpeed;
	
	Car() {
	}
	
	Car(String model) {
		/*
		 * this.model = model; this.color = null; this.maxSpeed = 0;
		 */
		this(model, null, 0);
	}
	
	Car(String model, String color) {
		/*
		 * this.model= model; this.color = color; this.maxSpeed = 0;
		 */
		this(model, color, 250);
	}
	
	Car(String model, String color, int maxSpeed) {
		this.model= model;
		this.color= color;
		this.maxSpeed= maxSpeed;
	}
}

