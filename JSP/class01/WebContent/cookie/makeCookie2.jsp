<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	// ------ Cookie 객체 생성 -----
	Cookie c0 = CookieBox.createCookie("code","0");
	response.addCookie(c0);
	
	Cookie c1 = CookieBox.createCookie("name","newCookie");
	response.addCookie(c1);
	
	Cookie c2 = CookieBox.createCookie("nickname","newCookieNick",60*30);
	response.addCookie(c2);
	
	Cookie c3 = CookieBox.createCookie("pw","1234",60*120);
	response.addCookie(c3);
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
	<h1>쿠키 생성 완료!</h1>
	<a href="viewCookie2.jsp">viewCookie</a><br>
	<a href="viewCookieJs.jsp">viewCookieJs</a><br>

</body>
</html>                   