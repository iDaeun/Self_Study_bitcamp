package sec04.exam01_overriding;

public class Computer extends Calculator {
@Override
double areaCircle(double r) {
	System.out.println("Calculator °´Ã¼ÀÇ arearCircle½ÇÇà");
	return Math.PI * r * r;
}
	 	}
	
