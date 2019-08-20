package com.bitcamp.mm.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.mm.member.domain.RequestMemberRegist;
import com.bitcamp.mm.member.service.MailSenderService;
import com.bitcamp.mm.member.service.MemberRegService;

@Controller
@RequestMapping("/member/regist")
public class MemberRegController {
	
	@Autowired
	private MemberRegService registService;
	@Autowired
	private MailSenderService mailSenderService;
	
	// member/regist => 
	// 1. nav에서 '회원가입' 클릭 -> get방식  
	// 2. 회원가입 정보 적고 submit -> post방식
	
	@RequestMapping(method = RequestMethod.GET)
	public String getForm() {
		return "member/registForm";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String memberRegist(RequestMemberRegist regist,
				HttpServletRequest request,
				Model model
			) {
		
		System.out.println(regist);
		
		int resultCnt = registService.memberInsert(request, regist);
		model.addAttribute("rCnt",resultCnt);
		
		mailSenderService.send(regist.getuId());
		
		return "member/memberRegist";
	}
}
