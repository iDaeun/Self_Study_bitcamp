<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<%
		session = request.getSession(false);
	%>
	
	name : <%= session.getAttribute("name") %> <br>
	id : <%= session.getAttribute("id") %> <br>
	isLogin : <%= session.getAttribute("isLogin") %> <br>
	age : <%= session.getAttribute("age") %> <br>
	<%= session.getAttribute("user") %>
</body>
</html>