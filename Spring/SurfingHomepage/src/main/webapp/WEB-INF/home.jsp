<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Surfing Homepage</title>
    
	<!-- css연결 -->
	<link href="<c:url value="/css/default.css"/>"  rel="stylesheet" type="text/css">
	<!-- 구글폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Coiny&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
    
    <style>
      
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <script>
    
/*             $(document).ready(function() {
            	
			//header클릭하면 메인페이지로 이동
            $('h1').click(function(){
            	alert('로그인 후 이용가능한 페이지입니다');
            	location.href="index.jsp";
            })

        }); */
    </script>
</head>

<body>

    <div id="main_wrap">
        <!-- header 시작 -->
		<%@include file="frame/header.jsp" %>
        <!-- header 끝 -->

        <!-- nav 시작 -->
		<%@include file="frame/nav.jsp" %>
        <!-- nav 끝 -->

        <!-- context 시작 -->
        <div id="context">
            <div id="ct">
                메인페이지 입니다!
            </div>
        </div>
        <!-- context 끝 -->

        <!-- footer 시작 -->
		<%@include file="frame/footer.jsp" %>
        <!-- footer 끝 -->
    </div>
</body></html>
