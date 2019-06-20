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
<link href="/mm/css/default.css" rel="stylesheet" type="text/css">
<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Merienda+One&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>

<body>
<div id="main_wrap">
<%	
	request.setCharacterEncoding("utf-8");
	
	String userId = request.getParameter("uId");
	String userPw = request.getParameter("uPw");
	String userName = request.getParameter("uName");
%>

<!-- 해더 시작 , 상대경로 -->
<%@include file="../frame/header.jsp" %>
<!-- 해더 시작 -->

<!-- nav 시작 -->
<%@include file="../frame/nav.jsp" %>
<!-- nav 시작 -->

<!-- contents 시작 -->
<div id="contents">
	<h3>회원가입요청 처리 페이지</h3>
	<hr>
	<table>
		<tr>
			<td>아이디(이메일)</td>
			<td><input type="email" name="uId" value="<%= userId%>"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="uPw" value="<%= userPw%>"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="uName" value="<%= userName%>"></td>
		</tr>
		<tr>
			<td>사진</td>
			<td><input type="file" name="uPhoto" required></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
		</tr>
	</table>
</div>
<!-- contents 시작 -->
	

<!-- footer 시작 -->
<%@include file="../frame/footer.jsp" %>
<!-- footer 끝 -->
</div>
</body>
</html>