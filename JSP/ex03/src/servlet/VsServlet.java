package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/vs.do")
public class VsServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//setCharacter은 get이든 post이든 항상 써주자~
		request.setCharacterEncoding("utf-8");
		String msg = request.getParameter("msg");
		response.setContentType("text/html; charset=utf-8");
		
		//동적으로 html페이지를 만들어줌
		//태그들을 문자열로 만들어서 하나하나 넣는게 불편함!
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset=\"UTF-8\">");
		out.println("<title>Insert title here</title>");
		out.println("<script src=\'https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js\'></script>");
		out.println("<body>");
		out.println("여기는 Servlet<br>");
		out.println("<h1>"+msg+"</h1>");
		out.println("</body>");
		out.println("</head>");
		out.println("</html>");
	}

}
