package com.surfing.mvc.member.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.surfing.mvc.exception.IdNotFoundException;
import com.surfing.mvc.exception.PwInvalidException;
import com.surfing.mvc.member.service.LoginService;


@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	// 로그인 폼 요청
	@RequestMapping(method = RequestMethod.GET)
	public String getLoginForm() {
		return "login/loginForm";
	}
	
	// 로그인 처리
	@RequestMapping(method = RequestMethod.POST)
	public String loginProcess(
			@RequestParam("id") String id,
			@RequestParam("pw") String pw,
			Model model
			) {
		
		String msg = "";
		boolean chk = false;
		
		try {
			
			chk = loginService.login(id, pw);
			
		} catch (IdNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = e.getMessage();
		} catch (PwInvalidException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = e.getMessage();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg = e.getMessage();
		}
		
		model.addAttribute("chk", chk);
		model.addAttribute("msg",msg);
		
		return "login/loginProcess";
	}
	
}
