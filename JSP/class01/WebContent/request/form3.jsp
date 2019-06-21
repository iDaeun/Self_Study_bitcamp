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

	<h1>action_forward / response sendRedirect() 비교</h1>
	<form action="action_forward.jsp">
		forward action <input type="text" name="name"> <input type="submit">
	</form>
	
	<form action="response_sendredirect.jsp">
		response sendRedirect <input type="text" name="name"> 
		<input type="submit">
	</form>

</body>
</html>