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
	<h1>Page_a.jsp에서 만들어진 응답결과</h1>
	<br>
	no 파라미터의 값: <%= request.getParameter("no") %>
	<br>
	uname 파라미터의 값: <%= request.getParameter("uname") %>
</body>
</html>