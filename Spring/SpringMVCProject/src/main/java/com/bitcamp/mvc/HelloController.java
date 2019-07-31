package com.bitcamp.mvc;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller // requestMapping 읽을 수 있도록 @Controller라고 설
public class HelloController {
	
	@RequestMapping("/hello")
	public ModelAndView hello() {
		
		// FrontController로 전송할 View 경로 & 결과 데이터 -> 저장하고 전달할 객체
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("hello"); // /WEB-INF/views/hello.jsp
		modelAndView.addObject("userName", "Cool"); // request속성으로 공유
		modelAndView.addObject("greeting","안녕하세요");
		modelAndView.addObject("now",new Date());
		
		return modelAndView;
	}
	
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
