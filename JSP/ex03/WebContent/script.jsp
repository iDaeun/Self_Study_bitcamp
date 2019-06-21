<!-- html 주석 : 소스보기에서 볼 수 있음 -->
<%-- JSP 주석 : 소스보기에서 볼 수 없음--%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%!
 	//이곳은 선언문 영역이며 실제 서블릿으로 파싱될때 그 서블릿의 필드영역(멤버영역)이다
 	String sayHello = "안녕하세요?";
 	Random ran = new Random();
 	public int sum(int a , int b){
 		return a+b;
 	}
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

</body>
</html>