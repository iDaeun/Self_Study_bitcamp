<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
</style>
</head>
<body>
	<h1>사원 이름 수정</h1>
	<hr>
	<form action="editEmp.jsp" method="post">
	사원번호 <input type = "number" name = "empno" required> <br>
	사원이름 <input type = "text" name = "ename" required> <br>
	<input type = "submit" value = "수정">
	</form>
</body>
</html>