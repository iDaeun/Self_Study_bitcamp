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
응답처리가 진행됩니다.
</body>
</html>
<%
	request.setAttribute("code", "code-1");
	/* code = null로 들어옴 :  */
%>

<!-- response_redirect => form3_result 으로 다시 호출해줌 -->
<% 
String name = request.getParameter("name");
response.sendRedirect("form3_result.jsp?type=B-Type&name="+name);
%>
