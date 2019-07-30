package member;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainForSpring {

	// private static Assembler assembler = new Assembler();

	// 스프링 컨테이너 생성 : 조립기 설정파일 appCtx1.xml, main method안에서 불러야 하니깐 static으로
	private static ApplicationContext ctx =

			new GenericXmlApplicationContext("classpath:appCtx7.xml");

	public static void main(String[] args) throws IOException {

		// 사용자가 입력한 문자열 -> reader 읽어오기
		BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

		while (true) {

			System.out.println("명령어를 입력해주세요.");

			String command = reader.readLine(); // 한줄 단위로 읽어오기

			// 3. 종료
			if (command.equalsIgnoreCase("exit")) {
				System.out.println("종료합니다.");
				break;
			}

			// 1. 회원가입
			// new kkangdda 1111 1111 daeun -> 띄어쓰기 split
			if (command.startsWith("new ")) {
				processNewCommand(command.split(" "));
			}

			// 2. 암호변경
			if (command.startsWith("change ")) {
				processChangeCommand(command.split(" "));
			}
		}
	}
	
	// -- 1. 회원가입
	private static void processNewCommand(String[] args) {
		// 잘라져서 들어오는 문자열의 배열이 5개인지 확인
		if (args.length != 5) {
			printHelp();
			return;
		}

		// 객체는 조립기에서 보관하고있음, 조립기에서 가져오기! (의존성 낮춤)
		// 여기서 new로 새로운 객체를 생성할 필요가 없다는 말!!!
		// MemberRegisterService service = assembler.getRegisterService();
										// 컨테이너에게 bean객체 반환을 요청하는 것, 
										// xml에서 memberDao를 주입하고 반환시킨다 !!
										// 반환 타입은 MemberRegisterService class타입으로
		MemberRegisterService service = ctx.getBean("registService", MemberRegisterService.class);
				
		RegisterRequest request = new RegisterRequest();

		// ex) new 이메일 사용자이름 암호 암호확인 -> 이메일 = index(1)
		request.setEmail(args[1]);
		request.setName(args[2]);
		request.setPassword(args[3]);
		request.setConfirmPassword(args[4]);

		if (!request.isPasswordEqualToConfirmPassword()) {
			System.out.println("암호 확인이 일치하지 않습니다.");
		}

		try {
			service.regist(request);
			System.out.println("등록되었습니다.");
		} catch (AlreadyExistingMemberException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("이미 존재하는 이메일입니다.");
		}

	}

	// -- 2. 암호변경
	private static void processChangeCommand(String[] args) {
		if (args.length != 4) {
			printHelp();
			return;
		}

		// ChangePasswordService service = assembler.getPwService();
		ChangePasswordService service = ctx.getBean("changePwService", ChangePasswordService.class);

		try {
			service.changePassword(args[1], args[2], args[3]);
			System.out.println("암호가 변경되었습니다.");
		} catch (MemberNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("존재하지 않는 이메일입니다.");
		} catch (IdPasswordNotMatchingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("이메일과 암호가 일치하지 않습니다.");
		}
	}

	// -- 잘못된 방식으로 입력했을 때 출력 :
	private static void printHelp() {
		System.out.println("");
		System.out.println("잘못된 명령입니다, 아래 명령사용법을 확인하세요");
		System.out.println("new 이메일 사용자이름 암호 암호확인");
		System.out.println("change 이메일 현재암호 새로운암호");
	}

}
