package com.surfing.mvc.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.surfing.mvc.member.domain.MemberInfo;
import com.surfing.mvc.member.service.MyPageService;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	@RequestMapping("/myPage")
	public String getMyPage(HttpServletRequest request, Model model) {
		
		MemberInfo memberInfo = null;
		memberInfo = myPageService.myPage(request);
		model.addAttribute("memberInfo",memberInfo);
		
		return "myPage/myPage";
	}
}
