<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	CookieBox cBox = new CookieBox(request);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>

	<h1>COOKIE DATA 2</h1>
	
	<h3>
		name = <%=cBox.getValue("name") %>
		nickname = <%= cBox.getValue("nickname") %>
		pw = <%= cBox.getValue("pw") %>
	</h3>
	
	<a href="editCookie2.jsp">editCookie</a>
	<a href="delCookie2.jsp">delCookie</a>
</body>
</html>