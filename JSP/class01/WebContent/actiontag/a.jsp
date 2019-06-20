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
	<h1>A페이지 입니다</h1>
	
	<!-- action tage - forward사용하기 -->
	<!-- 경로: http://localhost:9090/web/actiontag/a.jsp 이지만 b.jsp로 이동함 -->
	<jsp:forward page="b.jsp"></jsp:forward>
</body>
</html>