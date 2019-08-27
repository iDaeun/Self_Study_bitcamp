package com.petsite.members.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.petsite.members.domain.LoginInfo;
import com.petsite.members.domain.MemberInfo;
import com.petsite.members.service.MypageService;

@RestController
@CrossOrigin
@RequestMapping("/members/mypage")
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@GetMapping
	public MemberInfo myInfo() {
	/*public MemberInfo myInfo(HttpServletRequest request) {*/
		
		/*
		 * LoginInfo loginInfo = (LoginInfo) request.getSession().getAttribute("login");
		 * String id = loginInfo.getId();
		 * 
		 * MemberInfo memberInfo = mypageService.myInfo(id);
		 */
		MemberInfo memberInfo = mypageService.myInfo("sd@dd1");
		
		return memberInfo;
	}
}
