<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

	<!-- css연결 -->
	<link href="<c:url value="/css/default.css"/>" rel="stylesheet" type="text/css">
	<!-- 구글폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Coiny&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<style>
	table{
		width : 80%;
		border : 0;
		border-collapse: collapse;
	}
	table td{
			padding : 5px;
			border: solid 3px;
			text-align: center;
			background-color: rgba(178, 190, 195,0.5);
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
            <div id="ct">
                <h2>MYPAGE</h2>
				<form action="pwCheck" method="post" enctype="multipart/form-data">
					<table>
                	<tr>
                		<td>아이디</td>
                		<td>${memberInfo.id }</td>
                	</tr>
                	<tr>
                		<td>비밀번호</td>
                		<td>${memberInfo.pw }</td>
                	</tr>
                	<tr>
                		<td>이름</td>
                		<td>${memberInfo.name }</td>
                	</tr>
                	<tr>
                		<td>전화번호</td>
                		<td>${memberInfo.pNum }</td>
                	</tr>
                	<tr>
                		<td>사진</td>
                		<td>
						<c:choose>
							<c:when test="${memberInfo.photo eq 'none' }">
								<img style="width: 200px" alt="사진" src='<c:url value="/file/member_photo_upload/none.jpg"/>' />
							</c:when>
							<c:otherwise>
								<img style="width: 200px" alt="사진" src='<c:url value="/file/member_photo_upload/${memberInfo.photo}"/>' />
							</c:otherwise>
						</c:choose>
						</td>
                	</tr>
                	<tr>
                		<td>레벨</td>
                		<td>${memberInfo.level }</td>
                	</tr>
                	<tr>
                		<td></td>
                		<td><input type="submit" value="회원정보 수정"/></td>
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