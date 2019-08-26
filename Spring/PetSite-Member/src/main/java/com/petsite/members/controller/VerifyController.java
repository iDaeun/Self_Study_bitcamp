package com.petsite.members.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.petsite.members.service.MailSenderService;

@RestController
@CrossOrigin
@RequestMapping("/members/verify")
public class VerifyController {
	
	@Autowired
	private MailSenderService mailSenderService; 
	
	@GetMapping
	public String verify(
			@RequestParam("code") String code,
			@RequestParam("id") String id
			) {
		
		int cnt = mailSenderService.changeVerify(id);
		
		return cnt>0?"success":"fail";
	}

}
