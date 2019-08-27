package com.petsite.members.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
		/* public MemberInfo myInfo(HttpServletRequest request) { */

		/*
		 * LoginInfo loginInfo = (LoginInfo) request.getSession().getAttribute("login");
		 * String id = loginInfo.getId();
		 * 
		 * MemberInfo memberInfo = mypageService.myInfo(id);
		 */
		MemberInfo memberInfo = mypageService.myInfo("sd@dd1");

		return memberInfo;
	}

	// 내정보 수정 -> 기존 값 불러오기
	@GetMapping("/id")
	public MemberInfo editMyInfo(String id) {

		MemberInfo memberInfo = mypageService.myInfo(id);

		return memberInfo;
	}
	
	// 내정보 수정
	@PostMapping
	public String editProcess(HttpServletRequest request, MemberInfo memberInfo) {
		
		System.out.println(memberInfo);
		int cnt = mypageService.editProcess(request, memberInfo);
		
		return cnt>0?"success":"fail";
	}
}
