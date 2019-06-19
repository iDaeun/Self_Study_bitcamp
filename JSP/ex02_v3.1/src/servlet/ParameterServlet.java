package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/parameter.do")
public class ParameterServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getMethod();
		
		if(method.equals("GET")) {
			doGet(request, response);
		} else {
			doPost(request, response);
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//name에 입력한 데이터를 가져옴
		String name = request.getParameter("name");
		System.out.println(name);
		
		//hobby는 복수 -> 배열로 받아야함
		String[] hobbyArray = request.getParameterValues("hobby");
		for(String hobby : hobbyArray) {
			System.out.println(hobby);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//post방식으로 한들 데이터를 보낼 경우 -> 인코딩 방식을 지정해야함
		request.setCharacterEncoding("utf-8");
		
		//name에 입력한 데이터를 가져옴
		String name = request.getParameter("name");
		System.out.println(name);
		
		//hobby는 복수 -> 배열로 받아야함
		String[] hobbyArray = request.getParameterValues("hobby");
		for(String hobby : hobbyArray) {
			System.out.println(hobby);
		}
	}

}
