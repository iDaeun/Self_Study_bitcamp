<%@page import="com.surfing.mvc.domain.LoginInfo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<%	
	boolean chk = (boolean)request.getAttribute("chk");
	
	if(chk){
		session.setAttribute("loginInfo", new LoginInfo(request.getParameter("id"), request.getParameter("pw")));
	}
%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>

	<!-- css연결 -->
	<link href="<c:url value="/css/default.css"/>" rel="stylesheet" type="text/css">
	<!-- 구글폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Coiny&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
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
            <div id="ct">
                <h2>
                <c:if test="${chk}">
                	로그인되었습니다
                	<%=session.getAttribute("loginInfo").toString() %>
                </c:if>
                
                <c:if test="${!chk}">
                	${msg }
                </c:if>
                </h2>
                
                <a href="../index.jsp">메인페이지로 돌아가기</a>
            </div>
        </div>
        <!-- context 끝 -->

        <!-- footer 시작 -->
		<%@include file="../frame/footer.jsp" %>
        <!-- footer 끝 -->
    </div>
</body></html>

