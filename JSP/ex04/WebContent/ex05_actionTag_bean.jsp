<%@page import ="vo.PersonVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 자바 객체 생성 후 -->
<!-- 자바코드 -->
<%-- <%
	PersonVo vo = new PersonVo();
	vo.setName("강다은");
	vo.setAge(26);
	vo.setGender("female");
%> --%>

<!-- 자바 빈 : 태그 형식으로 작성 -->
<!-- tomcat은 나중에 PersonVo.java를 보고 pvo라는 객체를 생성함 -->
<jsp:useBean id="pvo" class="vo.PersonVo"></jsp:useBean>

<!-- set하기 -->
<%-- <jsp:setProperty property="name" value="강다은" name="pvo"/>
<jsp:setProperty property="age" value="100" name="pvo"/>
<jsp:setProperty property="gender" value="female" name="pvo"/> --%>

<!-- 파라미터 값으로 set하기 -->
<%-- <jsp:setProperty property="name" param="name" name="pvo"/>
<jsp:setProperty property="age" param="age" name="pvo"/>
<jsp:setProperty property="gender" param="gender" name="pvo"/> --%>

<!-- property값, param값 동일할때 : 파라미터 생략해도 된다! -->
<%-- <jsp:setProperty property="name" name="pvo"/>
<jsp:setProperty property="age" name="pvo"/>
<jsp:setProperty property="gender" name="pvo"/> --%>

<!-- 한번에 값을 지정할 수 있다! -->
<jsp:setProperty property="*" name="pvo"/>

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

	<!-- 자바코드 -->
<%-- 	이름: <%= vo.getName() %> --%>

	<!-- get하기 -->
	이름: <jsp:getProperty property="name" name="pvo"/>
	나이: <jsp:getProperty property="age" name="pvo"/>
	성별: <jsp:getProperty property="gender" name="pvo"/>
</body>
</html>