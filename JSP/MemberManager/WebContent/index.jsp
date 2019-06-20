<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
</style>

<!-- css파일 연결해주기 -->
<link href="css/default.css" rel="stylesheet" type="text/css">
<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Merienda+One&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>

<body>
<div id="main_wrap">

<!-- 해더 시작 , 상대경로 -->
<%@include file="frame/header.jsp" %>
<!-- 해더 끝 -->

<!-- nav 시작 -->
<%@include file="frame/nav.jsp" %>
<!-- nav 끝 -->

<!-- contents 시작 -->
<div id="contents">
	<h1>회원관리 프로그램의 메인 페이지입니다!!</h1>
</div>
<!-- contents 끝 -->

<!-- footer 시작 -->
<%@include file="frame/footer.jsp" %>
<!-- footer 끝 -->

</div>
</body>

</html>