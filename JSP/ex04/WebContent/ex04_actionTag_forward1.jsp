<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- JSP Model 1의 개발방법 (거의 안씀) -->
    <!-- 쓰는 것: Model 2 , MVC , Spring FrameWork -->
<%
	/* 데이터 생성 */
	String name = request.getParameter("name");
	String msg = name + "님 안녕?";
	/* forward2 파일로 보내주기위해 속성으로 객체 저장 */
	request.setAttribute("msg", msg);
%>
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
	<jsp:forward page="ex04_actionTag_forward2.jsp"/>
</body>
</html>