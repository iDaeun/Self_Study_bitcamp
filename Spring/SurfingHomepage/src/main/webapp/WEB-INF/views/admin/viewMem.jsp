<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
	* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	}
	
	body{
		background-image: url(/SurfingHomepage/css/images/5.jpg);
		background-repeat: repeat;
		background-size: 100% 1000px;
		max-width: 960px;
		min-width: 500px;
		margin: 0 auto;
	}
	
	#wrap{
		margin : 50px;
	}
	
	h1 {
		text-align: center;
		margin: 10px;
	}
	
	table{
		width : 80%;
		margin : 0 auto;
		border : 0;
		border-collapse: collapse;
	}
	
	table td{
		padding : 3px;
		border: solid 3px;
		text-align: center;
		background-color: rgba(253, 203, 110,0.5);
	}

	table tr:first-child>td {
		text-align : center;
		font-weight: bold;
	}
	
</style>
</head>
<body>

<div id="wrap">
<h1>회원 정보</h1>
	
	<!-- table 시작 -->
	
<table>
	<tr>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>전화번호</td>
		<td>사진</td>
		<td>레벨</td>
		<td>가입날짜</td>
	</tr>
	<tr>
		<td>${memberInfo.id }</td>
		<td>${memberInfo.pw }</td>
		<td>${memberInfo.name }</td>
		<td>${memberInfo.pNum }</td>
		
		<td>
		<c:choose>
			<c:when test="${memberInfo.photo eq 'none' }">
				<img style="width: 200px" alt="사진" src='<c:url value="/member_photo_upload/none.jpg"/>' />
			</c:when>
			<c:otherwise>
				<img style="width: 200px" alt="사진" src='<c:url value="/member_photo_upload/${memberInfo.photo}"/>' />
			</c:otherwise>
		</c:choose>
		</td>
		
		<td>${memberInfo.level }</td>
		<td>${memberInfo.registerDate }</td>
	</tr>
	<!-- table 끝 -->
</table>
</div>
</body>
</html>