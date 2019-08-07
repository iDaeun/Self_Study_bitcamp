package com.surfing.mvc.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.surfing.mvc.member.domain.MemberInfo;
import com.surfing.mvc.member.service.EditMemService;

@Controller
public class MemEditController {
	
	@Autowired
	private EditMemService editMemService;
	
	@RequestMapping("/pwCheck")
	public String getPwCheck() {
		return "myPage/pwCheck";
	}
	
	@RequestMapping("/editMem")
	public String editMem(MemberInfo memberInfo ,Model model) {
		
		model.addAttribute("memberInfo", memberInfo);
		
		return "myPage/editMem";
	}
	
	@RequestMapping("/editMemProcess")
	public String editMemProcess() {
		
		
		
		return "myPage/editMemProcess";
	}
}
