package filter;


import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter({ "/LoginCheckFilter", "/mypage/*" })
public class LoginCheckFilter implements Filter {


    public LoginCheckFilter() {
        // TODO Auto-generated constructor stub
    }


	public void destroy() {
		// TODO Auto-generated method stub
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest)request;
		
		HttpServletResponse resp = (HttpServletResponse)response;
		
		// 로그인 정보 -> session에 저장되어있음
//		Parameters:create - true to create a new session for this request if necessary; false to return null if there's no current session
//		Returns:the HttpSession associated with this request or null if create is false and the request has no valid session
		HttpSession session = req.getSession(false);
		
		boolean loginchk = false;
		
		// 1. 로그인 되어있는지 확인 -> 되어있으면 true
		if(session != null && session.getAttribute("LoginInfo") != null) {
			loginchk = true;
		}
		
		// 2. 로그인 되어있는지에 따라 다른 처리
		if(loginchk) {
			// 로그인 OOO -> chain => 등록한 다른 필터에 변경된 요청사항들을 보냄
			chain.doFilter(request, response);
			
		} else {
			// 로그인 XXX -> redirect
			resp.sendRedirect(req.getContextPath()+"/session/member/loginForm.jsp");
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/session/member/loginForm.jsp");
//			dispatcher.forward(request, response);
			
		}
		
		
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
