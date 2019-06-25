<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CookieBox cBox = new CookieBox(request);
	
	boolean loginChk = cBox.exist("LOGIN") && cBox.getValue("LOGIN").equals("SUCCESS");
	
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

	<h1>로그인 여부 확인</h1>
	<h3>
	<%
		if(loginChk){
			out.println("아이디는 "+cBox.getValue("ID")+"로 로그인 되어있는 상태임");
			out.println("<a href='logout.jsp'>로그아웃</a>");
		} else {
			out.println("로그인 되어있는 상태가 아닙니다");
		}
	%>
	</h3>

	
	<hr>
	<a href="loginForm.jsp">다시 돌아가기</a>
</body>
</html>