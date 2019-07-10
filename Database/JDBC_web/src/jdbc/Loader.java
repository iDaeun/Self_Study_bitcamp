package jdbc;

import java.util.StringTokenizer;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/Loader")
public class Loader extends HttpServlet {
	
	public void init(ServletConfig config)throws ServletException{
		
		//init-param가져오기 : DB드라이버 클래스 이름 -> 문자열 하나 있을 수도 있고, 콤마로 여러개 들어올 수도 있음
		String drivers = config.getInitParameter("jdbcdriver");
		StringTokenizer st = new StringTokenizer(drivers, ",");
		while(st.hasMoreTokens()) {
			String jdbcDriver = st.nextToken();
			
			//데이터베이스 드라이버 로드
			try {
				Class.forName(jdbcDriver);
				
				System.out.println("데이터베이스 드라이버 로드 성공");
				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
		}
	}

}
