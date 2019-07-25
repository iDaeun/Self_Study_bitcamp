package guestbook.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteFormService implements GuestBookService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		
		String viewPage = "/WEB-INF/view/confirmDeletion.jsp";
		
		// String id = request.getParameter("messageId");
		// request.setAttribute("messageId", id);
		// comfirmDeletion.jsp에서 ${param.messageID}로 받음 => FrontController에서 포워딩했기 때문에 request가 공유가 된다,
		// 즉, request.getParameter = ${param.어쩌구} 가능!!
		// 여기서는 그냥 viewPage만 지정해주기
		
		return viewPage;
	}

}
