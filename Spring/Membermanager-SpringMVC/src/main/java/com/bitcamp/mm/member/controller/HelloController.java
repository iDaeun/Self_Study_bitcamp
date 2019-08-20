package com.bitcamp.mm.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.mm.member.domain.MemberInfo;

@Controller
public class HelloController {
	
	@RequestMapping("/hello")
	public String page() {
		
		MemberInfo info = null;
		System.out.println(info.getIdx());
		
		return "main";
	}
	
	// NullPointerException예외발생하면 특정 페이지로 이동
	// Controller 내에서 예외처리를 디테일하게 설정할 수 있음 
	@ExceptionHandler(NullPointerException.class)
	public String handlerNullPointerException(NullPointerException ex) {
		
		return "error/nullException";
	}
}
