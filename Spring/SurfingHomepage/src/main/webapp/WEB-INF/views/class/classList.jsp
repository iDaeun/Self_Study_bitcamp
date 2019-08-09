<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CLASS</title>

	<!-- css연결 -->
	<link href="<c:url value="/css/default.css"/>" rel="stylesheet" type="text/css">
	<!-- 구글폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Coiny&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
	body {
		background-image: url(/surfing/css/images/4.jpg);
		background-size: 100%;
		background-repeat: repeat;
	}
	
	.class{
		margin: 5px;
		border: 3px solid black;
		padding: 10px;
		font-weight: bold;
	}
	
	.class:hover{
		background-color: black;
		color: white;
	}
</style>

</head>
<body>

    <div id="main_wrap">
        <!-- header 시작 -->
		<%@include file="../frame/header.jsp" %>
        <!-- header 끝 -->

        <!-- nav 시작 -->
		<%@include file="../frame/nav.jsp" %>
        <!-- nav 끝 -->

        <!-- context 시작 -->
        <div id="context">
            <div class="class">
                <a>Class - A (레벨:상)</a>
            </div>
            <div class="class">
                <a>Class - B (레벨:중)</a>
            </div>
            <div class="class">
                <a>Class - C (레벨:하)</a>
            </div>
        </div>
        <!-- context 끝 -->

        <!-- footer 시작 -->
		<%@include file="../frame/footer.jsp" %>
        <!-- footer 끝 -->
    </div>
</body></html>