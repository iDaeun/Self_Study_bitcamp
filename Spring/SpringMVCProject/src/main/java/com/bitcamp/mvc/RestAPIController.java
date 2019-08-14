package com.bitcamp.mvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.bitcamp.mvc.domain.Login;

@RestController
/* @RequestMapping("/restapi/{id}") */
public class RestAPIController {
	
	// 문자열 타입 
	// @GetMapping(value = "/restapi/hello") -> method방식이 GET으로 정해져있는 것
	@RequestMapping(name = "/restapi/hello", method = RequestMethod.GET)
	public String hello() {
		return "hello";
	}
	
	// 객체 타입
	@RequestMapping("/restapi/login")
	public Login login() {
		
		Login login = new Login();
		login.setuId("cool");
		login.setuPw("123456");
		
		return login;
	}
	
	// list방식
	@RequestMapping("/restapi/loginList")
	public List<Login> loginList() {
		
		List<Login> list = new ArrayList<Login>();
		
		Login login = new Login();
		login.setuId("cool");
		login.setuPw("123456");
		
		list.add(login);
		
		login = new Login();
		login.setuId("hot");
		login.setuPw("789");
		
		list.add(login);		
		
		return list;
	}
	
	// map방식
	@RequestMapping("/restapi/loginMap")
	public Map<String, Login> loginMap() {
		
		Map<String, Login> maps = new HashMap<String, Login>();
		
		Login login = new Login();
		login.setuId("cool");
		login.setuPw("123456");
		
		maps.put("1", login);
		
		login = new Login();
		login.setuId("hot");
		login.setuPw("789");
		
		maps.put("2", login);	
		
		return maps;
	}
}
