package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import member.MemberDao;

// 컨테이너가 생성될때 AppContext 클래스도 같이 생성됨
@Configuration
public class AppCtx1 {
	
	@Bean
	public MemberDao getMemberDao() {
		return new MemberDao();
	}
	
	@Bean
	public MemberDao getMemberDao1() {
		return new MemberDao();
	}
	
}
