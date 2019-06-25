<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    Cookie c1 = CookieBox.createCookie("id", "prac");
    response.addCookie(c1);
    
    Cookie c2 = CookieBox.createCookie("pw", "1111", 60);
    response.addCookie(c2);
    
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
쿠키생성
<a href="viewCookies.jsp">viewCookie</a><br>
</body>
</html>