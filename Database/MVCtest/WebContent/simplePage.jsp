<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- http://localhost:9090/MVCtest/simple?type=greeting 또는 그외의 것일때 나오는 페이지 -->
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
	<h1>${result}</h1>
</body>
</html>