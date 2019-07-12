package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

// 이부분 주석처리하면 실행 안됨
//@WebFilter(
//		urlPatterns = { "/*" }, 
//		initParams = { 
//				@WebInitParam(name = "encoding", value = "UTF-8")
//		})
public class CharacterEncodingFilter implements Filter {

	private String encoding;

	public CharacterEncodingFilter() {
		// TODO Auto-generated constructor stub
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		// encoding 적용하기
		request.setCharacterEncoding(encoding);

		// 다른 필터에 체인처럼 연결
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		encoding = fConfig.getInitParameter("encoding");
		if (encoding == null) {
			encoding = "UTF-8";
		}

	}

}
