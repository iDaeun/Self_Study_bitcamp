<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="list.jsp"%>
    <!-- 자바코드를 적는 곳 -->
<%
	String str = new String("회원가입 폼");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
	img{
		width: 100px;
	}
</style>

</head>
<body>
<!-- 동적으로 내용 바꿔줌! -->
<h1><%= str %></h1>
<!-- (localhost:9090) + / + 절대경로 (web/member/list.jsp)-->
<a href="/web/member/list.jsp">회원리스트</a><br>
<!-- 절대경로 -->
<img alt="이미지" src="/web/images/crop.jpg">

<script>
	$(document).ready(function(){
		alert('회원 가입 페이지입니다.');
	});
</script>
</body>
</html>