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
<h1>회원가입</h1>
<form action="regMember.jsp">
<!-- UserInfo의 변수 값과 name의 값이 동일해야한다!! -->
아이디: <input type="text" name="id">
비밀번호: <input type="password" name="pw">
이름: <input type="text" name="name">
address: <input type="text" name="address">
email: <input type="text" name="email">
<input type="submit">
</form>
</body>
</html>