<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//삭제하는 메소드가 아니라 유효시간을 0으로 준 쿠키를 생성함
	Cookie c1 = new Cookie("name","");
	c1.setMaxAge(0); //단위 : 초단위
	response.addCookie(c1);
	
	Cookie c2 = new Cookie("code","");
	c2.setMaxAge(0);
	response.addCookie(c2);
%>
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
<h1>쿠키 정보가 삭제되었습니다</h1>
<a href="viewCookie.jsp">viewCookie</a>

</body>
</html>