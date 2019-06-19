<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
 <h1>
	<!-- 표현식 = : println(new String(어쩌구) -->
	<!-- JSP(Java Server)자바 코드를 쓸수 있는 영역! -->
	<%= new String("Test") %>	
	<%= new java.util.Date() %>
</h1>
</body>
</html>