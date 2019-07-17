<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- http://localhost:9090/MVCtest/simple?type=date 일때 나오는 페이지 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
</style>
</head>
<body>
	<!-- SimpleController.java에서 request.setAttribute했음 -->
	<!-- EL로 불러오기 ${requestScope.result} -->
	<h1>현재 시간은: ${result}</h1>
</body>
</html>