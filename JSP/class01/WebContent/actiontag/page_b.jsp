<%@page import="users.model.Member"%>
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
	<h1>Page_b.jsp에서 만들어진 응답결과</h1>
<%-- 	<br>
	no 파라미터의 값: <%= request.getParameter("no") %>
	<br>
	uname 파라미터의 값: <%= request.getParameter("uname") %> --%>
	
	<!-- ==== JSTL사용 ==== -->
	pageType = ${pageType} <br>
	pNo = ${pNo} <br>
	userName = ${userName}<br>
	<hr>	
<%-- 	<%
		/* getAttribute return값 = object -> Member으로 형변환 */
		Member member = (Member)request.getAttribute("result");
	%>
	<%= member %>
	아이디: <%= member.getId() %><br>
	이름: <%= member.getName() %><br>
	번호: <%= member.getpNum() %><br> --%>
</body>
</html>