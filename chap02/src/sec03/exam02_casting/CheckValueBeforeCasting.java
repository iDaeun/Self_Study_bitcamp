package sec03.exam02_casting;

public class CheckValueBeforeCasting {

	public static void main(String[] args) {
		
		int i = 5000000;
		
		if (i<Short.MIN_VALUE || i>Short.MAX_VALUE) {
			System.out.println("byte 타입으로 변환할 수 없습니다.");
			System.out.println("값을 다시 확인해 주세요.");
		} else {
			short b = (short) i;
			System.out.println(b);
		}


	}

}
