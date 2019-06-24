<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userInfo" class="member.UserInfo"/>
<jsp:setProperty property="name" value="hot" name="userInfo"/>
<!-- 
	1. 해당 영역(page)에 userInfo 이름의 member.UserInfo 타입 객체가 있는지 확인
	2. 있다면 현재 저장되어있는 객체를 반환
	3. 없다면 new member.UserInfo(); 새로운 객체 생성
	3-1. pageContext.setAttribute("userInfo", new member.UserInfo() );
 -->
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
	<% userInfo.setId("cool"); %> 
	
	<%=userInfo.getId() %> <br>
	<%=userInfo.getName() %>

</body>
</html>