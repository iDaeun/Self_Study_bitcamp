package sec13.exam03_field_method_access.package1;

public class B {
	public B() {
		A a = new A();
		a.field1 = 1;
		a.field2 = 2;
		//a.field3 = 3;
		
		a.method1();
		a.method2();
		//a.method3();
	}
}
