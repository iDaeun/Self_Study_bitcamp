package service;

import javax.servlet.http.HttpServletRequest;

import dao.Dao;

public class GreetingService implements Service{
	
	// 응답코드
//	public Object getObject(HttpServletRequest request) {
//		
//		Object object = null;
//		
//		Dao dao = new Dao();
//		dao.insert();
//		
//		String str = "안녕하세요";
//		object = str;
//		
//		return object;
//		
//	}
	
	// *** 한번에 처리 *** 
	public String getViewPage(HttpServletRequest request) {
		// 응답코드 생성 후 request에 저장
		request.setAttribute("result", "안녕하세요");
		// viewPage 지정
		return "/simplePage.jsp";
	}
}
