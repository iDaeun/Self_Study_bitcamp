package util;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieBox {
	
	//Cookie 데이터들을 Map에 저장해서 관리
	//Map 인스턴스 생성, private / Map<key=String, value=Object>
	private Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();
	
	//생성자 : 초기화 -> request객체에서 Cookie[]받아서 cookieMap에 저장
	public CookieBox(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if(cookies!=null && cookies.length>0) {
			//반복처리 : Cookie객체를 Map에 저장
			for(int i=0; i<cookies.length; i++) {
				cookieMap.put(cookies[i].getName(), cookies[i]);
			}
		}
	}
	
	//쿠키 생성하는 메소드
	// ----- 오버로딩 ----- : 이름 , 값 
	public static Cookie createCookie(String name, String value) throws IOException {
		Cookie c =  new Cookie(name, URLEncoder.encode(value, "utf-8"));
		return c;
	}
	
	// ----- 오버로딩 ----- : 이름 , 값 , 유효시간
	public static Cookie createCookie(String name, String value, int maxAge) throws IOException {
		Cookie c = new Cookie(name, URLEncoder.encode(value, "utf-8"));
		c.setMaxAge(maxAge);
		return c;
	}
	
	// ----- 오버로딩 ----- : 이름 , 값 , 도메인, 경로, 유효시간
	public static Cookie createCookie(String name, String value, String domain, String path, int maxAge) throws IOException {
		Cookie c = new Cookie(name, URLEncoder.encode(value, "utf-8"));
		c.setPath(path);
		c.setMaxAge(maxAge);
		c.setDomain(domain);
		return c;
	}
	
	// 쿠키 정보를 반환하는 메소드 (매개변수: 이름)
	// static 처리 안함 -> map이 인스턴스 변수이기 때문
	public Cookie getCookie(String name) {
		return cookieMap.get(name);
	}
	
	// 쿠키 데이터 반환하는 메소드
	public String getValue(String name) {
		Cookie c = cookieMap.get(name);
		if(c == null) {
			return null;
		}
		return c.getValue();
	}
	
	// 쿠키 데이터가 존재하는지?
	// -> not null일때 true(존재)이다
	public boolean exist(String name) {
		return cookieMap.get(name) != null;
	}
}
