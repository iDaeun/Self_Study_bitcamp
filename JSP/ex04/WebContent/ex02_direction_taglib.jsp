<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
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
	jstl 중에서 core library 사용하기:
	<ul>
	<!-- 자바에서의 for문을 html처럼 쓸 수 있게 해준다 -->
	<core:forEach var="index" begin="0" end="10">
		<li>${index }번째 행</li>
	</core:forEach>
	</ul>
	<hr>
	<ul>
	<%
		for(int i=0; i<=10; i++){
	%>
		<li><%=i+10 %>번째 행</li>
	<%	
		}
	%>
	</ul>
</body>
</html>