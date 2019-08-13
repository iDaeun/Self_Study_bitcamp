package com.bitcamp.mm.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.mm.member.service.MemberDeleteService;

@Controller
public class MemberDeleteController {
	
	@Autowired
	private MemberDeleteService deleteService;
	
	@RequestMapping("/member/memberDelete")
	public String delete(
			@RequestParam("memberId") int id
			) {
		
		deleteService.memberDelete(id);
		
		return "redirect:/member/memberList";
	}
	
	@RequestMapping("/member/delete/{id}")
	public String del(@PathVariable("id") int id) {

		deleteService.memberDelete(id);
		
		return "redirect:/member/memberList";
	}
}
