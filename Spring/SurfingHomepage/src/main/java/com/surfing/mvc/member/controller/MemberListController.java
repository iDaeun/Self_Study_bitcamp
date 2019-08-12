package com.surfing.mvc.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.surfing.mvc.member.domain.ListViewData;
import com.surfing.mvc.member.domain.SearchParam;
import com.surfing.mvc.member.service.MemberListService;

@Controller
public class MemberListController {
	
	@Autowired
	private MemberListService listService;
	
	@RequestMapping("/jason/memberList")
	@ResponseBody // Json사용
	public ListViewData memberList(
			Model model,
			@RequestParam(value = "p", defaultValue = "1") int pageNumber,
			@RequestParam(value = "sType", required = false) String sType,
			@RequestParam(value = "keyword", required = false) String keyword
			) {
		
		SearchParam searchParam = null;
		
		if(sType != null && 
				keyword != null
				&& !sType.isEmpty()
				&& !keyword.isEmpty()
				) {
			searchParam = new SearchParam();
			searchParam.setsType(sType);
			searchParam.setKeyword(keyword);
		}
		
		// service
		ListViewData listData = listService.getListData(pageNumber, searchParam);
		//model.addAttribute("viewData",listData);
		
		return listData;
	}
	
	@RequestMapping("/memberList")
	public String memberList1(
			Model model,
			@RequestParam(value = "p", defaultValue = "1") int pageNumber,
			@RequestParam(value = "sType", required = false) String sType,
			@RequestParam(value = "keyword", required = false) String keyword
			) {
		
		SearchParam searchParam = null;
		
		if(sType != null && 
				keyword != null
				&& !sType.isEmpty()
				&& !keyword.isEmpty()
				) {
			searchParam = new SearchParam();
			searchParam.setsType(sType);
			searchParam.setKeyword(keyword);
		}
		
		// service
		ListViewData listData = listService.getListData(pageNumber, searchParam);
		model.addAttribute("viewData",listData);
		
		return "admin/memList";
	}
}
