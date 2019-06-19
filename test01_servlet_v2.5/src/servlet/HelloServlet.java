package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// service메소드 오버라이딩 해줘야함 (명목상만 메소드, 사실은 빈털털이!)

		// Hello.html의 name 값을 담아주기
		// client에서 보낸 데이터 -> servlet에서 사용하기
		String name = request.getParameter("name");

		// response=응답하는데에 활용하는 객체, setContentType=내용 설정하는 메소드
		// 문서의 종류는 text, 확장자는 html
		// text를 utf-8로 디코딩 해라
		response.setContentType("text/html; charset=utf-8");
		
		//getWriter()리턴값 = printwriter
		//print()->응답할 데이터 집어넣음
		response.getWriter().print(name+"님 안녕?");
		
		//***서버가 요청을 받으면, 데이터를 활용하여 html를 동적으로 생산함
	}

}
