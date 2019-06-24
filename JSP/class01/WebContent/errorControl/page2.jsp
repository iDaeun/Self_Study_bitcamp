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
<!-- name -> null -> toUpperCase() => NullPointerException 예외발생! -->
name 파라미터 값 : <%= request.getParameter("name").toUpperCase() %>

</body>
</html>