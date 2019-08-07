package com.surfing.mvc.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClassListController {
	
	@RequestMapping("/class")
	public String getClassList() {
		return "class/classList";
	}
}
