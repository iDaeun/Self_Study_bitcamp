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

	<!-- get방식으로 설정 -->
	<form action="page2.jsp" method="get">

	no <input type="text" name="no" value="0">
	name <input type="text" name="uname">
	
		Page Type 
		<!-- 파라미터 = "type" -->
		<select name="type">
		
			<option>선택하세요</option>
			<option value="a">A</option>
			<option value="b">B</option>
			<option value="c">C</option>
		</select>
		<input type="submit" value="보내기">
	</form>

</body>
</html>