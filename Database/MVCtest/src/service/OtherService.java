package service;

import javax.servlet.http.HttpServletRequest;

public class OtherService implements Service{
public String getViewPage(HttpServletRequest request) {
		
		// 핵심 처리 
		// 결과를 request 속성에 저장
		request.setAttribute("result", "Invalid type");
		
		// view 지정 반환
		return "/simplePage.jsp";
	}
}
