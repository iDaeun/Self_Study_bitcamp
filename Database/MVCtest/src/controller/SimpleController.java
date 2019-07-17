package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*@WebServlet("/simple")*/
public class SimpleController extends HttpServlet {
	
	// doGet, doPost -> 모두 다 process메소드 실행
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1) 요청파악 : 파라미터 값으로 사용자 요청을 분석, 구분
		String command = request.getParameter("type");
		
		// 응답결과
		String resultObj = "";
		String viewpage = "";
		
		// 2) 요청에 맞는 기능 수행 : Model 처리 (Service + DAO + 기능 class) => 결과 데이터 반환
		if(command == null || command.equals("greeting")) {
			// 각 처리마다 -> 다른 뷰로 가게끔 처리 
			// viewpage = 응답코드 생성(a.jsp 안에서 응답코드만 달리 생성)
			resultObj = "안녕하세요";
			viewpage = "/simplePage.jsp";
		} else if (command.equals("date")) {
			resultObj = new Date().toString();
			viewpage = "/datePage.jsp";
		} else {
			resultObj = "Invalid type";
			viewpage = "/simplePage.jsp";
		}
		
		// 3) 결과 데이터를 request 또는 session 영역에 속성으로 저장 = view로 데이터 전달, 공유 역할
		request.setAttribute("result", resultObj); // <-view에서는 EL로 표현만 해주면 됨!
		
		// 4) 포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewpage);
		dispatcher.forward(request, response);
		
	}
}
