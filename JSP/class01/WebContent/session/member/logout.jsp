<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	//현재 세션을 삭제함
    	session.invalidate();
    
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

	<h1>정상적으로 로그아웃 되었습니다.</h1>
	<a href="loginChk.jsp">loginChk -> 로그아웃 확인해보기</a>

</body>
</html>