package sec13.exam03_field_method_access.package2;

import sec13.exam03_field_method_access.package1.*;

public class C {
	public C() {
		A a = new A();
		a.field1 = 1;
		//a.field2 = 2;
		//a.field3 = 3;
		
		a.method1();
		//a.method2();
		//a.method3();
	}
}
