package com.bitcamp.mm.member.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	// responsebody써서 Json형태 객체로 반환해주기 + 상태값 설정
	// 방법 1
	@RequestMapping("/member/json/memberListJson")
	public @ResponseBody ListViewData memberListJson(
			@RequestParam(value = "p", defaultValue = "1") int pageNumber, 
			@RequestParam(value = "stype", required = false) String stype,
			@RequestParam(value = "keyword", required = false) String keyword,
			HttpServletResponse response) {
		
		SearchParam searchParam = null;
		
		if(stype != null && keyword != null) {
			searchParam = new SearchParam();
			searchParam.setType(stype);
			searchParam.setKeyword(keyword);
		}
		
		// service
		ListViewData listdata = listservice.getListData(pageNumber, searchParam);
		System.out.println("전체 회원의 수 : "+ listdata.getTotalCount());
		
		// 상태값 설정
		//response.setStatus(HttpServletResponse.SC_OK); // = 200코드
		response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		
		return listdata;
	}
	
	// 방법 2
	// 반환 타입이 ResponseEntity<T> : Spring 4.2이상
	// 반환하는 Body, statusCode, HttpHeader
	@RequestMapping("/member/json/memberListJson2")
	@ResponseBody 
	public ResponseEntity<ListViewData> memberListJson2(
			@RequestParam(value = "p", defaultValue = "1") int pageNumber, 
			@RequestParam(value = "stype", required = false) String stype,
			@RequestParam(value = "keyword", required = false) String keyword) {
		
		SearchParam searchParam = null;
		
		if(stype != null && keyword != null) {
			searchParam = new SearchParam();
			searchParam.setType(stype);
			searchParam.setKeyword(keyword);
		}
		
		// service
		ListViewData listdata = listservice.getListData(pageNumber, searchParam);
		System.out.println("전체 회원의 수 : "+ listdata.getTotalCount());
		
		// 응답할 때 상태코드 포함시켜서 넘김
		ResponseEntity<ListViewData> entity = new ResponseEntity<ListViewData>(listdata, HttpStatus.OK);
		
		return entity;
	}

}
