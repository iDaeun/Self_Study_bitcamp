<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 자바코드 쓰기 */
	/* JSP파일은 Servlet파일로 변환됨, 따라서 request가져다가 사용할 수 있음 */
	String msg = request.getParameter("msg");
%>
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
	여기는 JSP<br>
	<!-- 자바코드 response.getWriter().println(msg) -->
	<h1><%=msg %></h1>
</body>
</html>