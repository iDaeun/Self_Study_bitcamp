package com.surfing.mvc.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.surfing.mvc.member.domain.MemberInfo;
import com.surfing.mvc.member.service.RegService;

@Controller
@RequestMapping("/regist")
public class RegController {
	
	@Autowired
	private RegService regService;
	
	// 회원가입 폼 요청
	@RequestMapping(method = RequestMethod.GET)
	public String getRegForm() {
		
		// reForm.jsp로 이동
		return "reg/regForm";
	}
	
	// 회원가입 처리
	@RequestMapping(method = RequestMethod.POST )
	public String regProcess(MemberInfo memberInfo, 
							HttpServletRequest request,
							Model model) {
		
		int rCnt = regService.reg(memberInfo, request);
		model.addAttribute("rCnt",rCnt);
		model.addAttribute("memberInfo",memberInfo);
		
		//regProcess.jsp로 이동
		return "reg/regProcess";
	}
	
}
