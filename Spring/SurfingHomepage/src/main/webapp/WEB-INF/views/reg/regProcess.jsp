<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.surfing.mvc.domain.MemberInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Surfing Homepage</title>

<!-- css연결 -->
<link href="<c:url value="/css/default.css"/>" rel="stylesheet"
	type="text/css">
<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Coiny&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">

<style>
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>
	
</script>
</head>

<body>

	<div id="main_wrap">
		<!-- header 시작 -->
		<%@include file="../frame/header.jsp"%>
		<!-- header 끝 -->

		<!-- nav 시작 -->
		<%@include file="../frame/nav.jsp"%>
		<!-- nav 끝 -->

		<!-- context 시작 -->
		<div id="context">
			<div id="ct">
				
				<c:if test="${rCnt>0}">
				
				<!-- 3) 회원가입된 정보 출력하기 -->
				<h2>성공적으로 가입되었습니다!</h2>
				<h2>가입정보:</h2>
				${member.html()}


				<h3>${rCnt}개 행이 추가되었습니다!!</h3>
				<h4>
					<c:if test="${not empty memberInfo.photo and memberInfo.fileSize>0}">
						<div id="img_info">
							<span style="font-weight: bold">저장한 이미지 출력</span> <br>
							
							<div id="user_photo">	
							<img style="width: 200px" alt="사진" src='<c:url value="/member_photo_upload/${memberInfo.photoName}"/>' />
							</div>
							
							파일 이름 : ${memberInfo.photoName} ( ${memberInfo.fileSize} ) <br> 
							<%-- 파일 타입 : ${type}<br> 
							저장 파일 이름 : ${savedPhoto}<br> 
							저장 폴더 : ${dir}<br> 
							저장 위치 : 
							<c:if test="${memory }">
							"메모리저장"
							</c:if>
							<c:if test="${!memory }">
							"임시파일저장"
							</c:if><br> --%>
							
							<hr>
							
							<a id="move" href="<c:url value="/"/>">메인페이지로 돌아가기</a>
						</div>
					</c:if>

				</h4>

				<a href="smiList.jsp">관리자 -> LIST</a>

				<!-- 4) 로그인 페이지로 이동 -->
				<a href="../member/loginForm.do">로그인하러가기</a>
				</c:if>
				
				<c:if test="${rCnt<=0}">
					<h3>회원가입 실패</h3>
				</c:if>
			</div>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="../frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>
</body>
</html>