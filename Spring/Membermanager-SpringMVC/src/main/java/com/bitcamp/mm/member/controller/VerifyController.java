package com.bitcamp.mm.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.mm.member.service.MailSenderService;

@Controller
public class VerifyController {
	
	@Autowired
	MailSenderService mailSenderService;
	
	@RequestMapping("/regCheck")
	public String regCheck(
			@RequestParam("code") String code,
			Model model
			) {
		
		model.addAttribute("code",code);
		
		return "member/regCheck";
	}
	
	@RequestMapping("/sendEmail")
	public String sendEmail() {
		
		mailSenderService.send(memberInfo);
		
		return "";
	}
}
