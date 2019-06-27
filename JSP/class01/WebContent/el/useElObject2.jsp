<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 정보가 저장되었는지 확인용 -->
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
	<h3>
		<!-- name -> value 찾아오기 -->
		request영역의 name01: ${requestScope.name01} <br>
							<%= request.getAttribute("name01") %><br>
		session영역의 name02: ${sessionScope.name02} <br>
		application영역의 name03: ${applicationScope.name03} 
	</h3>
</body>
</html>