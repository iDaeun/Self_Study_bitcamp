package com.bitcamp.mvc;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller // requestMapping 읽을 수 있도록 @Controller라고 설정
public class HelloController {
	
	// DefaultAnnotationHandlerMapping -> @RequestMapping어노테이션 사용
	// 클라이언트 요청 URL과 Controller를 매핑하는 것 (=controller결정)
	@RequestMapping("/hello")
	public ModelAndView hello() {
		
		// FrontController로 전송할 View 경로 & 결과 데이터 -> 저장하고 전달할 객체
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hello"); // /WEB-INF/views/hello.jsp으로 이동하게함 (ViewResolver에 인해서)
		modelAndView.addObject("userName", "Cool"); // request속성으로 공유
		modelAndView.addObject("greeting","안녕하세요");
		modelAndView.addObject("now",new Date());
		
		return modelAndView;
	}
	
	// 추가적으로 설정할 수도 있음
	@RequestMapping("/hello1")
	public ModelAndView hello1() {
		
		// FrontController로 전송할 View 경로 & 결과 데이터 -> 저장하고 전달할 객체
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hello"); // /WEB-INF/views/hello.jsp
		modelAndView.addObject("userName", "Cool"); // request속성으로 공유
		modelAndView.addObject("greeting","안녕하세요");
		modelAndView.addObject("now",new Date());
		
		return modelAndView;
	}
	
	
}
