<%@page import="java.util.Enumeration"%>
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
	<h1>
		<%= application.getInitParameter("logEnabled") %><br>
		<%= application.getInitParameter("debugLevel") %><br>
		<%
			Enumeration initParamNames = application.getInitParameterNames();
			while(initParamNames.hasMoreElements()){
				out.print(initParamNames.nextElement()+"<br>");
			}
		%>
		
	</h1>
</body>
</html>