<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1 {
	text-align: center;
}
div{
	width: 45%;
	float: left; 
	padding: 10px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<h1>include 지시어</h1>
	<hr>
	<!-- 메뉴시작!!!! -->
	<%@ include file="include/top.jsp"%>
	<!-- 메뉴 끝 -->
	<!-- 왼쪽 영역 시작 -->
	<%@ include file="include/left.jsp"%>
	<!-- 왼쪽 영역 끝 -->
	<!-- 오른쪽 영역 시작 -->
	<%@ include file="include/right.jsp"%>
	<!-- 오른쪽 영역 끝 -->
	
	<!-- footer시작 -->
	<jsp:include page="include/footer.jsp">
	<jsp:param value="test@test" name="email"/>
	<jsp:param value="0123" name="tel"/>
	</jsp:include>
	<!-- footer끝 -->

</body>
</html>