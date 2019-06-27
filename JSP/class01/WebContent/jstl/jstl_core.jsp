<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- taglib추가 -->
    <!-- core 태그 사용하기 -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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

	<!-- 출력 태그 -->
	<!-- default="nono!"= 데이터 없을때 출력되는 부분 
		escape="false" => <span>값을 html으로 인식하겠다! == default로 설정한 내용임
	-->
	<c:out value="${param.code}" escapeXml="false">
		<span style="color:red">b</span>
	</c:out>

</body>
</html>