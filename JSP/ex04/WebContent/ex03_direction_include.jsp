<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- MAIN -->
<%
	String name = "홍길동";
	/* request 객체에 저장시키기 */
	request.setAttribute("name", name);
%>
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
	메인 페이지
	<!-- 하나sublet 관리 -->
	<%@include file="sub1.jsp" %>
	<hr>
	<!-- 두개sublet 관리 -> 서로 변수를 공유할 수 없음 => request객체 속성으로 보내줌-->
	<jsp:include page="sub2.jsp"></jsp:include>
</body>
</html>