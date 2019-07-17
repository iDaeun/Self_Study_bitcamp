package service;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class DateService implements Service{
	public String getViewPage(HttpServletRequest request) {
		
		// 핵심 처리 
		// 결과를 request 속성에 저장
		request.setAttribute("result", new Date());
		
		// view 지정 반환
		return "/datePage.jsp";
	}
}
