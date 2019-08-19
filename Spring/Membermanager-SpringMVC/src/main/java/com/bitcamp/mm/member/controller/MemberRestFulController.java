package com.bitcamp.mm.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bitcamp.mm.member.domain.MemberInfo;
import com.bitcamp.mm.member.domain.RequestMemberEdit;
import com.bitcamp.mm.member.domain.RequestMemberRegist;
import com.bitcamp.mm.member.service.MemberDeleteService;
import com.bitcamp.mm.member.service.MemberEditService;
import com.bitcamp.mm.member.service.MemberListService;
import com.bitcamp.mm.member.service.MemberRegService;


@RestController // @Responsebody를 생략한다
@RequestMapping("/rest/members")
public class MemberRestFulController {
	
	@Autowired
	private MemberListService listService;
	
	@Autowired
	private MemberDeleteService deleteService;
	
	@Autowired
	private MemberRegService regService;
	
	@Autowired
	private MemberEditService editService;
	
	@GetMapping() // == @RequestMapping(method=RequestMethod.GET)
	// @Responsebody
	// public List<MemberInfo> getAllList(){
	public ResponseEntity<List<MemberInfo>> getAllList(){
		
		List<MemberInfo> list = listService.getAllList();
		
		// ResponseEntity : 4.2버전 이상, @Responsebody대신 쓰는 것, list객체가 JSON타입으로 반환됨 (body, 상태값 설정)
		ResponseEntity<List<MemberInfo>> entity = new ResponseEntity<List<MemberInfo>>(list, HttpStatus.OK);
		// HTTPStatus.NOT_FOUND => 404
		// HTTPStatus.OK => 200
		// HTTPStatus.INTERNAL_SERVER_ERROR => 500
		
		return entity;
	}

	@CrossOrigin
	@DeleteMapping("/{id}") // pathVariable -> /rest/members/12 (여기서 '12'를 변수로 받아서 처리해줌)
	public ResponseEntity<String> deleteMember(
			@PathVariable("id") int idx
			) {
		
		//int cnt = deleteService.memberDelete(idx);
		
		return new ResponseEntity<String>(deleteService.memberDelete(idx)>0?"SUCCESS":"FAIL",HttpStatus.OK) ;
	}
	
	// JSON 대신 일반 파라미터 형식으로 보낼때 (regRequest)
	@CrossOrigin
	@PostMapping // == @RequestMapping(method=RequestMethod.POST)
	public ResponseEntity<String> regMember(
			RequestMemberRegist regRequest,
			HttpServletRequest request
			) {
		
		int cnt = regService.memberInsert(request, regRequest);
		
		return new ResponseEntity<String>(cnt>0?"SUCCESS":"FAIL",HttpStatus.OK);
	}
	
	// 수정할 회원 정보 얻어오기
	@CrossOrigin
	@GetMapping("/{id}")
	public ResponseEntity<MemberInfo> editMember(
			@PathVariable("id") int idx
			){
		MemberInfo memberInfo = editService.getEditFormData(idx);
		return new ResponseEntity<MemberInfo>(memberInfo, HttpStatus.OK);
	}
	
	// 회원 수정 처리
	@CrossOrigin
	@PutMapping
	public String editProcess(
			@RequestBody RequestMemberEdit editMember,
			HttpServletRequest request
			){
		
		System.out.println(editMember);
		int cnt = editService.edit(editMember, editMember.getOldFile(), request);
		
		return cnt>0?"SUCCESS":"FAIL";
	}
	
}
