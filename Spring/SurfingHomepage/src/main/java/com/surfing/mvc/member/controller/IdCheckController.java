package com.surfing.mvc.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.surfing.mvc.member.service.MemberIdCheckService;

@Controller
public class IdCheckController {

	@Autowired
	private MemberIdCheckService memberIdCheckService;
	
	@RequestMapping("/reg/idCheck")
	public String idCheck(@RequestParam("id") String id, Model model) {
		
		String resultCode = memberIdCheckService.idCheck(id);
		model.addAttribute("resultCode",resultCode);
		
		return "login/idCheck";
	}
	
}
