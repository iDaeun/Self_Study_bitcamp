package config;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import member.BoardDao;
import member.ChangePasswordService2;
import member.MemberDao;
import member.MemberRegisterService2;

// 컨테이너가 생성될때 AppContext 클래스도 같이 생성됨
@Configuration
public class AppContext {

	@Bean(name = "memberDao1")
	@Qualifier("sys1")
	//@Scope("prototype") // singleton(default) => prototype
	public MemberDao getMemberDao() {
		return new MemberDao();
	}
	
	@Bean
	// name정하지 않으면 id값 getBoardDao -> getBoardDao로 설정됨
	public BoardDao boardDao() {
		return new BoardDao();
	}
	
	@Bean(name = "registService2")
	public MemberRegisterService2 getMemberRegisterService2() {
		// 생성자 방식 : return new MemberRegisterService2(getMemberDao());
		
		// setter 방식: 주입
		MemberRegisterService2 service = new MemberRegisterService2();
		// @Autowired : 생략 service.setMemberDao(getMemberDao());
		return service;
	}
	
	@Bean(name = "changePwService2")
	public ChangePasswordService2 getChangePasswordService2() {
		// 생성자 방식 : return new ChangePasswordService2(getMemberDao());
		
		// setter 방식: 주입
		ChangePasswordService2 service = new ChangePasswordService2();
		// @Autowired : 생략 service.setMemberDao(getMemberDao());
		return service;
	}
}
