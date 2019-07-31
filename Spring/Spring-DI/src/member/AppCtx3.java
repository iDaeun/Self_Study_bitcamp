package member;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
// 컨테이너가 생성될때 AppContext 클래스도 같이 생성됨
@Configuration
@ComponentScan( basePackages = "member" )
public class AppCtx3 {
	
	}

