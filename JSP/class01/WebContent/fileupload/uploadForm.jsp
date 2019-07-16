<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	<h1>과제제출</h1>
	<hr>
	
	<!-- 이 부분 빠뜨리면 절대 안 됨 !!! -->
	<form action="fileUpload.jsp" method="post" enctype="multipart/form-data">
		이름:<input type="text" name="uName"><br>
		학번:<input type="text" name="sNumber"><br>
		과제:<input type="file" name="report"><br>
		<input type="submit" value="업로드">
	</form>
</body>
</html>