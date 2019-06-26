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

	<h1> session을 이용한 데이터 저장 </h1>
	<%
		session.setAttribute("name", "KING");
		session.setAttribute("id", "tiger");
		session.setAttribute("isLogin", true);
		session.setAttribute("age", 20);
		// 위 정보들 -> class를 만들어 객체를 생성하여 -> 특정 객체를 저장하는 형식으로 만들 수 있다!
	%>
	<h3>session에 데이터를 저장했습니다.</h3>
	
	<a href="viewSession.jsp">viewSession1</a> <br>
	<a href="../response/viewSession.jsp">response/viewSession1</a><br>
	<a href="logout.jsp">logout</a>

</body>
</html>