<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    Cookie c5 = CookieBox.createCookie("id", "", 0);
    response.addCookie(c5);
    
    Cookie c6 = CookieBox.createCookie("pw", "", 0);
    response.addCookie(c6);
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
<h1>쿠키 정보가 삭제되었습니다</h1>
<a href="viewCookies.jsp">viewCookie</a>
</body>
</html>