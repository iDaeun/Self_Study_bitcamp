package com.bitcamp.mm.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.mm.member.service.MemberRegService;

@Controller
public class MemberIdCheckController {

	@Autowired
	private MemberRegService regService;

	@RequestMapping("/member/idCheck1") // Ajax
	public String idCheck1(
			@RequestParam("id") String id,
			Model model
			) {
		
		model.addAttribute("result",regService.idCheck(id));
		
		return "member/idCheck";
	}

	@RequestMapping("/member/idCheck2") // Ajax
	@ResponseBody // 반환하는 값이 응답처리로 설정됨 (뷰 페이지가 아니라)
	public String idCheck2(
			@RequestParam("id") String id
			) {
		
		return regService.idCheck1(id);
	}
}
