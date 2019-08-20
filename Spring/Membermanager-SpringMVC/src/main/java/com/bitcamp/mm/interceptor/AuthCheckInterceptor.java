package com.bitcamp.mm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// session에 loginInfo 속성이 존재하면 -> return true
		// 현재 요청에서 session 객체 받기
		HttpSession session = request.getSession(false); // session객체 없으면 새로 만들 수 없도록

//		if (session != null) {
//			// session에서 loginInfo 속성값 가져오기
//			Object auth = session.getAttribute("loginInfo");
//			if (auth != null) {
//				return true;
//			}
//		}
		
		if(session != null && session.getAttribute("loginInfo") != null) {
			return true;
		}
		
		response.sendRedirect(request.getContextPath()+"/member/login");
		
		return false; // 존재하지 않으면 -> return false
	}
}
