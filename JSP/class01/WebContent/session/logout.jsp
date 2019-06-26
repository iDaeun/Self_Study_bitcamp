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
	/* 현재 session 소멸시킴 */
	request.getSession(false).invalidate();
	// = session.invalidate();
%>
<h1>로그아웃 되었습니다.</h1>
	
	<a href="viewSession.jsp">viewSession1</a> <br>
	<a href="../response/viewSession.jsp">response/viewSession1</a>
</body>
</html>