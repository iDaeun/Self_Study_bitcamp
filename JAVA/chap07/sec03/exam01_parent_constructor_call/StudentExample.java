package sec03.exam01_parent_constructor_call;

public class StudentExample {

	public static void main(String[] args) {
		Student student = new Student("ȫ�浿", "1234-12345", 1);
		System.out.println(student.name);
		System.out.println(student.ssn);
		System.out.println(student.studentNo);

	}

}
