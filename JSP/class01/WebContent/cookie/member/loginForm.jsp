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

	<h1>로 그 인</h1>
	
	<hr>
	<form action="login.jsp" method="get">
	
	아이디 <input type="text" name="id"> <br>
	아이디 저장하기  <input type="checkbox" name="save"> <hr>
	비밀번호 <input type="password" name="pw"> <br>

	<input type="submit" value="LOGIN"> <br>
	
	</form>
	
	<br>
	<a href="loginCheck.jsp">loginCheck</a>

</body>
</html>