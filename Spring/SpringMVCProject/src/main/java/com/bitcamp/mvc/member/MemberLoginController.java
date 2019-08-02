package com.bitcamp.mvc.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/member/memberLogin") //공통 URL처리 -> 2가지 방식에 따라 다른 처리

public class MemberLoginController {
	
	@RequestMapping(method = RequestMethod.GET) // 1. get방식일때
	public String getForm() {
		
		return "member/loginForm2"; // + .jsp
	}
	
	@RequestMapping(method = RequestMethod.POST) // 2. post방식일때
	public String login(HttpServletRequest request, Model model) {
						// Model객체 사용 -> Model과 연결 (결과 데이터 담음)
		
		String id = request.getParameter("uId");
		String pw = request.getParameter("uPw");
				
		System.out.println(id+"&&"+pw);
		
		// 결과 데이터 담기 (=modelAndView.addObject)
		model.addAttribute("id",id); // => EL로 받아줌
		model.addAttribute("pw",pw);
		
		return "member/login"; // + .jsp
	}

}
