package com.petsite.members.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.petsite.members.domain.MemberInfo;
import com.petsite.members.service.LoginService;
import com.petsite.members.service.RegService;

@RestController
@CrossOrigin
@RequestMapping("/members/login")
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@PostMapping
	public ResponseEntity<String> login(
			HttpServletRequest request,
			@RequestParam("id") String id,
			@RequestParam("pw") String pw
			) {
		
		int cnt = loginService.login(id, pw, request);
		
		return new ResponseEntity<String>(cnt>0?"success":"fail", HttpStatus.OK);
	}
}
