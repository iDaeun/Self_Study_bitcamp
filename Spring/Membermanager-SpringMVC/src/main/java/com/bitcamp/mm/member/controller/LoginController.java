package com.bitcamp.mm.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.mm.member.service.MemberLoginService;

@Controller
@RequestMapping("member/login")
public class LoginController {
	
	@Autowired
	private MemberLoginService loginService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String loginForm(HttpServletRequest request) {
		
		// 로그인 안되었을 때 -> 로그인 페이지로
		String view = "member/loginForm";
		
		// 로그인 되어있을 때 -> 메인 페이지로
		HttpSession session = request.getSession(false); //현재 세션 반환, 없으면 null값 반환
		if(session != null && session.getAttribute("loginInfo") != null) {
			view = "redirect:/main"; // = response.sendRedirect
		}
		
		return view;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String login(
			@RequestParam("uId") String id,
			@RequestParam("uPw") String pw,
			HttpServletRequest request
			) {
		
		// 로그인 실패 -> loginFail.jsp -> loginForm.jsp
		String view = "member/loginFail";
		boolean loginChk = loginService.login(id, pw, request);
		
		if(loginChk) {
			// 로그인 성공 -> redirect
			view = "redirect:/main";
		}
		
		
		
		
		return view;
	}
}
