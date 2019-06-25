<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Cookie c3 = CookieBox.createCookie("id", "changed");
    	response.addCookie(c3);
    	
    	Cookie c4 = CookieBox.createCookie("pw", "changed", 60);
    	response.addCookie(c4);
    
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
쿠키정보 변경
<a href="viewCookies.jsp">viewCookie</a>
</body>
</html>