package util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieBox {
	private Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();

	public CookieBox(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				cookieMap.put(cookies[i].getName(), cookies[i]);
			}
		}
	}
	
	public static Cookie createCookie(String name, String value) {
		Cookie c = new Cookie(name, value);
		return c;
	}
	
	public static Cookie createCookie(String name, String value, int maxAge ) {
		Cookie c = new Cookie(name, value);
		c.setMaxAge(maxAge);
		return c;
	}

	public Cookie getCookie(String name) {
		return cookieMap.get(name);
	}
	
	public String getValue(String name) {
		Cookie cookie = cookieMap.get(name);
		if(cookie == null) {
			return null;
		}
		return cookie.getValue();
	}
	
	public boolean exist(String name) {
		return cookieMap.get(name) != null;
	}
}
