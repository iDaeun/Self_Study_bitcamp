<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>index page</h1>
	<ul>
		<!-- "/hello"라는 controller찾아서 viewPage 겟겟 (requestMapping) -->
		<!-- 경로 설정 다른 형식으로 하기!!! -->
		<li> <a href="/mvc/hello">/hello</a> </li> <!-- 앞에 '/'넣어서 서버의 root 넣어줌 -->
		<li> <a href="member/login">/member/login</a> </li> <!-- 상대경로 -->
		<li> <a href="<c:url value="/member/memberLogin" />">/member/memberLogin</a> </li> <!-- CORE태그 사용 -->
		<li> <a href="<c:url value="/order/order" />">/order/order</a> </li>
		<li> <a href="<c:url value="/cookie/makeForm" />">/cookie/makeForm</a> </li>
		<li> <a href="<c:url value="/cookie/viewCookie" />">/cookie/viewCookie</a> </li>
		
	</ul>
</body>
</html>