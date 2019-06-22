<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- SUB -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<!-- libaray를 import하지 않아도 사용 가능함 (하나의 sublet이기 때문) -->
<script>
	$(document).ready(function(){
		$("#myP").html("서브1페이지 입니다<%= name %>");	
	});

</script>
<style>
</style>
</head>
<body>
	<p id="myP"></p>
</body>
</html>