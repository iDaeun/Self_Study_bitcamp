<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>
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

	<h1>404 요청한 페이지 찾을 수 없음 -> 주소 올바르게 입력 바람</h1>
	<a href="<%=request.getContextPath()%>">홈으로 이동</a> 

</body>
</html>