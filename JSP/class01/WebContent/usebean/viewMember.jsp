<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userData" class="member.UserInfo" scope="request"/>
<!-- request.getAttribute("userData") -->
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
	<h1>forward된 페이지이고, usebean을 통한 데이터 공유임</h1>
	<%=userData %>
</body>
</html>