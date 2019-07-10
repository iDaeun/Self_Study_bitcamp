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
	<h1>삭제할 사원 번호를 입력해주세요</h1>
	<hr>
	<form action="deleteEmp.jsp" method="post">
	사원번호 <input type = "number" name = "empno" required> <br>
	<input type = "submit" value = "삭제">
	</form>
</body>
</html>