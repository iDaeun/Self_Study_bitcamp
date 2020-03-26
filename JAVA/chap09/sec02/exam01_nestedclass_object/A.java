package sec02.exam01_nestedclass_object;

public class A {
	A() {
		System.out.println("A按眉啊 积积凳");

	}
	
	class B {
		int field1;
		B() {
			System.out.println("B按眉啊 积积凳");
		}
		void method1() { }
	}
	
	static class C {
		int field1;
		static int field2;
		C() {
			System.out.println("C按眉啊 积己凳");
		}
		void method1() { }
		static void method2() { }
	}
	
	void method() {
		class D {
			int field1;
			D() {
				System.out.println("D按眉啊 积己凳");
			}
			void method1() { }
		}
		D d = new D();
		d.field1 = 3;
		d.method1();
	}
}
