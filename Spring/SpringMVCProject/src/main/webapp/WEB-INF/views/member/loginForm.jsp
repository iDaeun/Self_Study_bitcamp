<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인폼</title>
</head>
<body>
	<h1>Login Form</h1>
	<hr>
	
	<!-- <form action="loginProcess" method="post"> -->
	<!-- <form action="loginProc" method="post"> -->
	<form action="loginOk" method="post">
	아이디: <input type="text" name="uId">
	비밀번호: <input type="password" name="uPw">
	<input type="submit" value="로그인">
	</form>
</body>
</html>