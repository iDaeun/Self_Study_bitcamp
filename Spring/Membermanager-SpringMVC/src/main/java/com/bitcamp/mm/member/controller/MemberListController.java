package com.bitcamp.mm.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.mm.member.domain.ListViewData;
import com.bitcamp.mm.member.domain.SearchParam;
import com.bitcamp.mm.member.service.MemberListService;

@Controller
public class MemberListController {

	@Autowired
	private MemberListService listservice;

	@RequestMapping("/member/memberList")
	public String memberList(
			@RequestParam(value = "p", defaultValue = "1") int pageNumber, 
			@RequestParam(value = "stype", required = false) String stype,
			@RequestParam(value = "keyword", required = false) String keyword,			
			Model model) {
		
		SearchParam searchParam = null;
		
		if(stype != null && keyword != null) {
			searchParam = new SearchParam();
			searchParam.setType(stype);
			searchParam.setKeyword(keyword);
		}
		
		// service
		ListViewData listdata = listservice.getListData(pageNumber, searchParam);
		System.out.println("전체 회원의 수 : "+ listdata.getTotalCount());

		/*
		 * for(MemberInfo m : listdata.getMemberList()) { System.out.println(m); }
		 */

		model.addAttribute("viewData", listdata);

		return "member/memberList";
	}

}
