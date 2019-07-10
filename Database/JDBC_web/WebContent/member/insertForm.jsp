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
	<h1>사원 정보 추가</h1>
	<hr>
	<form action="insertEmp.jsp" method="post">
	사원번호 <input type = "number" name = "empno" required> <br>
	사원이름 <input type = "text" name = "ename" required> <br>
	사원업무 <input type = "text" name = "job" required> <br>
	<input type = "submit" value = "추가">
	</form>
</body>
</html>