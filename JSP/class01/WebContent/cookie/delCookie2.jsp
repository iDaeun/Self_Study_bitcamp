<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	Cookie c1 = CookieBox.createCookie("name", "", 0); //0초 설정은 쿠키 삭제와 같다
	response.addCookie(c1);
	
	Cookie c2 = CookieBox.createCookie("code", "", 0);
	response.addCookie(c2);
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
<h1>쿠키 정보가 삭제되었습니다</h1>
<a href="viewCookie2.jsp">viewCookie</a>

</body>
</html>