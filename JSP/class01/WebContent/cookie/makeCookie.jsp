<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//쿠키 등록 방법 (쿠키를 굽는다)
	// 1. 쿠키 객체를 생성 : new Cookie(쿠키 이름, 데이터)
	// 2. response 객체에 쿠키 추가 : response.addCookie(쿠키객체 참조변수)
	
	// 쿠키 객체 생성
	Cookie cookie = new Cookie("code","ace");
	// response에 쿠키 객체 추가
	response.addCookie(cookie);
	
	Cookie c1 = new Cookie("name", "강다은");
	response.addCookie(c1);
	
	/* 쿠키 유효시간 설정해보기 */
	Cookie c2 = new Cookie("id", "KKANGDDA");
	c2.setMaxAge(60); //1분
	response.addCookie(c2);
	
	Cookie c3 = new Cookie("email","123@test.com");
	c3.setMaxAge(60*60); //1시간
	response.addCookie(c3);
%>
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
	<h1>쿠키 생성 완료!</h1>
	<a href="viewCookie.jsp">viewCookie</a>

</body>
</html>                   