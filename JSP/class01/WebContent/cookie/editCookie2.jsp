<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Cookie c = CookieBox.createCookie("name", "editName");
	response.addCookie(c);
	
	Cookie c1 = CookieBox.createCookie("code", "editCode");
	response.addCookie(c1);
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
	<h1>쿠키 정보가 변경되었습니다</h1>
	<a href="viewCookie2.jsp">viewCookie</a>
	
</body>
</html>