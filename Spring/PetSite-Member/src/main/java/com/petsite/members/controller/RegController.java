package com.petsite.members.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.petsite.members.domain.MemberInfo;
import com.petsite.members.service.RegService;

@RestController
@CrossOrigin
@RequestMapping("/members")
public class RegController {
	
	@Autowired
	private RegService regService;
	
	@PostMapping
	public ResponseEntity<String> regMem(
			HttpServletRequest request,
			MemberInfo memberInfo
			) {
		
		int cnt = regService.memInsert(request, memberInfo);
		
		return new ResponseEntity<String>(cnt>0?"success":"fail", HttpStatus.OK);
	}
}
