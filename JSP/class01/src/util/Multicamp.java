package util;

import java.util.Scanner;

public class Multicamp {
	public static void main(String[] args) {

//		int c = 10;
//		int d = 7;
//
//		// 10진수를 2진수로 변환
//		System.out.println(c & d);
//		System.out.println(c | d);
//
//		System.out.println();
//
//		int score = 60;
//		// 50점 초과면 합격 아니면 불합격
//		String result3 = score > 50 ? "합격" : "불합격";
//		System.out.println(result3);
//
//		int hunger = 40;
//		// 50이하면 냉장고 빵먹어 출력
//		if (hunger < 50) {
//			System.out.println("냉장고 빵먹어");
//		}
//
//		Scanner sc = new Scanner(System.in);

//		int hours;
//		System.out.println("입력");
//		hours = sc.nextInt();
//		System.out.println(hours);
//		
//		double income;
//		if(hours>8) {
//			income = (8-hours)*8350*1.5 + hours * 8350*1.5;
//		} else {
//			income = hours * 8350;
//		}
//		System.out.println("income : "+ income);
//		
//		
//		System.out.println("입력: ");
//		int amount = sc.nextInt();
//
//		if (amount > 8000) {
//			System.out.println("36%");
//		} else if (amount <= 8000 && amount > 4000) {
//			System.out.println("27");
//		} else if (amount <= 4000 && amount > 1000) {
//			System.out.println("18%");
//		} else if (amount <= 1000) {
//			System.out.println("9%");
//		}

		
		

//		int i = 2;
//		while (i < 10) {
//			for (int j = 1; j < 10; j++) {
//				System.out.println(i + "*" + j + "=" + i * j);
//			}
//			i++;
//		}

//		int ans = 89;
//
//		System.out.println("입력:::");
//		Scanner sc = new Scanner(System.in);
//		int userAn = sc.nextInt();
//
//		do {
//
//			if (userAn < ans) {
//				System.out.println("정답보다 낮음");
//				break;
//			}
//
//			if (userAn > ans) {
//				System.out.println("정답보다 높음");
//				break;
//			}
//			
//			if (userAn == ans) {
//				System.out.println("정답");
//				break;
//			}
//
//		} while (userAn != ans);
		
		

//		int i = 2;
//		for (int j = 1; j < 10; j++) {
//			System.out.println(i + "*" + j + "=" + i * j);
//		}
		
		
		
		for (int k = 2; k < 10; k++) {
			for (int j = 1; j < 10; j++) {
				System.out.println(k + "*" + j + "=" + k * j);
			}
		}

	}
}
