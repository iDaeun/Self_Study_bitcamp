<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 페이지 지시어 또 만들기 -->
<%@ page import="java.util.Calendar" %>
<%@ page session="true" %> <!-- 페이지 내에서 session을 사용할 수 있다 -->
<%@ page buffer = "8kb" %> <!-- 페이지를 이용할때 이 크기로 가져간다 -->
<%@ page isThreadSafe = "true" %> <!-- 기본값 = true -->
<%@ page info= "page 지시어 실습하는 페이지 입니다" %>
<%@ page errorPage="error.jsp"  %> <!-- 에러 발생하면 이동할 페이지 -->
<%
	Calendar c = Calendar.getInstance();
	
	/* 에러발생! */
	//int number = 100/0;
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
	page 연습 JSP
</body>
</html>