<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//브라우저가 서버로 요청할때 모든 쿠키 정보를 함께 전송
	Cookie[] cookies = request.getCookies();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>

	<h1>COOKIE DATA</h1>
	
	<!-- EL표현식 -->
	<!-- 쿠키에 key값을 참조하여 cookie객체를 가져온다음 -> getValue() -->
	<h3>EL을 이용한 Cookie 참조</h3>
	<h4>name : ${cookie.name.value }</h4>
	<h4>id : ${cookie.id.value }</h4>
	<h4>email : ${cookie.email.value }</h4>
	<h4>code2 : ${cookie.code2.value }</h4>
	
	<hr>

	<%
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {

				//if (cookies[i].getName().equals("name")) {
	%>
		<h3>
		<%="name: " + cookies[i].getName() + " / "%>
		<%="value: " + cookies[i].getValue()%>
		</h3>

	<%
		//}
	}
}
	%>
	
	<a href="editCookie.jsp">editCookie</a>
	<a href="delCookie.jsp">delCookie</a>
</body>
</html>