package sec04.exam01_overriding;

public class Computer extends Calculator {
@Override
double areaCircle(double r) {
	System.out.println("Calculator ��ü�� arearCircle����");
	return Math.PI * r * r;
}
	 	}
	
