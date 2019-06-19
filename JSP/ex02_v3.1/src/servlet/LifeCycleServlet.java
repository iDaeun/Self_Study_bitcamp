package servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/life.do")
public class LifeCycleServlet extends HttpServlet {

	public LifeCycleServlet() {
		System.out.println("---생성자---");
	}

	public void init(ServletConfig config) throws ServletException {
		System.out.println("---init---");
		//처음 생성될때 실행되어야하는 내용 적기
	}

	public void destroy() {
		System.out.println("---destroy()---");
		//소멸될때 실행되어야하는 내용 적기
		//주로: 열었던 스트림을 닫거나, 사용한 메모리를 반환(close());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("---service()---");
		System.out.println(request.getMethod());
				
		//요청을 구분해서 요청방식이 get이면 doGet()호출
		//post이면 doPost()호출
		String method = request.getMethod();
		if(method.contentEquals("GET")) {
			doGet(request, response);
		} else {
			doPost(request, response);
		}
		
		//get이든 post이든 공통으로 수행해야할 로직 작성 -> service()내에서 doget, dopost호출
		//요청마다 공통으로 수행해야하는 내용 적기 
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("---doGet()---");
		//get방식일때 실행해야할 로직 적기
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("---doPost()---");
		//post방식일때 실행해야할 로직 적기
	}

}
