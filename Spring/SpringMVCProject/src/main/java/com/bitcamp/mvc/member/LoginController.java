package com.bitcamp.mvc.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.mvc.domain.Login;

@Controller
public class LoginController {
	
	// 로그인 폼 페이지 요청
	@RequestMapping(value="/member/login")
	public String getLoginForm() {
		// 메소드 리턴값 String으로 view page지정함
		
		// View Path : Resolver의 범위에 포함된 경로
		return "member/loginForm"; // = /WEB-INF/views/member/loginForm.jsp로 페이지 이동
	}
	
	// 로그인 처리
												// 속성 추가(method방식) = 사용자의 요청을 좀 더 세분화 한 것 
												// <form method="post" 일때만 처리해줌
	@RequestMapping(value="/member/loginProcess", method = RequestMethod.POST) 
									// 로그인 폼에 입력한 내용 받기 위함 (request)
	public ModelAndView loginProcess(HttpServletRequest request) {
		
		String id = request.getParameter("uId");
		String pw = request.getParameter("uPw");
		
		System.out.println(id +"/"+ pw);
		
		ModelAndView modelAndView = new ModelAndView();
		
		// View Name 설정
		modelAndView.setViewName("member/login"); // = /WEB-INF/views/member/login.jsp로 페이지 이동
		modelAndView.addObject("id",id);
		modelAndView.addObject("pw",pw);
		
		return modelAndView;
	}
	
	@RequestMapping("/member/loginProc")
	public String loginproc(@RequestParam(value = "uId", defaultValue = "cool") String id, 
							// request.getParameter("uId") -> id에 대입
							// defaultValue -> null값이 들어왔을 때 디폴트값
							@RequestParam(value = "uPw", required = false) String pw,
							Model model
							) {
		
		System.out.println(id+"--"+pw);
		
		model.addAttribute("id",id);
		model.addAttribute("pw",pw);
		
		return "member/login";
	}
	
	@RequestMapping("/member/loginOk")
	/*public String loginOk(Login login) {
	 * -> <login.jsp> ${login.uId}로 호출해야함
	 * */
	public String loginOk(@ModelAttribute("user") Login login) {
	// @ModelAttribute : 이름 설정해주기
	// -> <login.jsp> ${user.uId}로 호출해야함
		
		System.out.println(login.getuId() +":"+ login.getuPw() );
		
		login.setuId(login.getuId()+"1212");
		
		return "member/login";
	}
}
