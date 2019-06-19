<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
img {
	width: 100px;
}
</style>

</head>
<body>

	<%
		Calendar c = Calendar.getInstance();
	%>

	<h1>
		회원 리스트
		<%=c.get(Calendar.YEAR) %>년
		<%=c.get(Calendar.MONTH) %>월
		<%=c.get(Calendar.DATE) %></h1>
	<!-- 상대경로 -->
	<a href="memberReg.jsp">회원가입</a>
	<br>
	<!-- 상대경로 -->
	<img alt="이미지" src="../images/marvel.jpg">
	<br>
	<a href="file.jsp">파일  수정 
	
	
	
	</a>
</body>
</html>