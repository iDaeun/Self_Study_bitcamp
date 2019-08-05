<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <%
    	String savedId = "";
    	Cookie[] c = request.getCookies();
    	for(int i=0; i<c.length; i++){
    		if(c[i].getName().equals("savedId")){
    			savedId = c[i].getValue();
    		}
    	}
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>

	<!-- css연결 -->
	<link href="<c:url value="/css/default.css"/>"  rel="stylesheet" type="text/css">
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
                <h2>LOGIN PAGE</h2>
                <form action="loginProcess" method="post">
                <table>
                	<tr>
                		<td>아이디</td>
                		<td>
                		<input type="text" name="id" value="<%=savedId%>">
                		아이디 저장 <input type="checkbox" name="save" value="checked">
                		</td>
                	</tr>
                	<tr>
                		<td>비밀번호</td>
                		<td><input type="password" name="pw"></td>
                	</tr>
                	<tr>
                		<td></td>
                		<td><input type="submit" value="로그인"></td>
                	</tr>
                </table>
                </form>
            </div>
        </div>
        <!-- context 끝 -->

        <!-- footer 시작 -->
		<%@include file="../frame/footer.jsp" %>
        <!-- footer 끝 -->
    </div>
</body></html>