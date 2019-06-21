<!-- html 주석 : 소스보기에서 볼 수 있음 -->
<%-- JSP 주석 : 소스보기에서 볼 수 없음--%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%!
 	//이곳은 선언문 영역이며 실제 서블릿으로 파싱될때 그 서블릿의 필드영역(멤버영역)이다
 	// = class의 바디영역
 	String sayHello = "안녕하세요?";
 	Random ran = new Random();
 	public int sum(int a , int b){
 		return a+b;
 	}
 %>
 <%
 	//이곳을 스크립트릿 영역이며 service()메소드의 지역(바디)영역이다
 	//service가 매개변수로 -> request, response받아서 여기서도 쓸 수 있는것!
 	request.setCharacterEncoding("utf-8");
 	String msg = request.getParameter("msg");
 	
 	//response.setContentType("text/html; charset=utf-8");
 	response.getWriter().println("메세지:" + msg);
 	
 	//application, pageContext, session객체 모두 사용 가능하다
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	스크립트요소 스터디
	<%out.println(sayHello); %>
	<!-- 파라미터공간이기 때문에 ';'붙이지 않는다!!! -->
	<%= sayHello %>
	<%= sum(10,20) %>

</body>
</html>