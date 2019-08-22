package com.bitcamp.mm.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.mm.member.domain.MemberInfo;
import com.bitcamp.mm.member.service.MailSenderService;

@Controller
public class VerifyController {
	
	@Autowired
	MailSenderService mailSenderService;
	
	@RequestMapping("member/regCheck")
	public String regCheck(
			@RequestParam("code") String code,
			@RequestParam("id") String id,
			Model model
			) {
		
		int result = 0;
		if(code != null) {
			result = mailSenderService.verify(id);
		}
		
		model.addAttribute("result",result);
		model.addAttribute("code",code);
		
		return "member/regCheck";
	}
	
	@RequestMapping("member/sendEmail")
	@ResponseBody
	public String sendEmail(
			@RequestParam("id") String id
			) {
		
		MemberInfo memberInfo = mailSenderService.getMemberInfo(id);
		int result = mailSenderService.send(memberInfo);
		
		return result>0?"SUCCESS":"FAIL";
	}
}
