<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>

<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Coiny&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
<style>
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
}

#main_wrap {
	padding-top: 20px;
}

h1 {
	text-align: center;
	font-size: 5vw;
	font-family: 'Coiny', cursive;
	background-color: black;
	margin: 0 30px;
}

h1>a {
	color: white;
}

body {
	background-image: url(/surfing/css/images/8.jpg);
	background-repeat: repeat;
	background-size: inherit;
	max-width: none;
	min-width: 500px;
	margin: 0 auto;
}

#wrap {
	margin: 30px;
	background-color: black;
}

h2 {
	text-align: center;
	padding: 20px 0 0 0;
	color: white;
}

table {
	width: 80%;
	margin: 0 auto;
	border: 0;
	border-collapse: collapse;
}

table td {
	padding: 3px;
	border: solid 3px;
	text-align: center;
	color: white;
}

table tr:first-child>td {
	text-align: center;
	font-weight: bold;
}

div #pagingBox {
	overflow: hidden;
	padding: 15px;
	width: 80%;
	margin: 0 auto;
}

#pagingBox>div {
	float: left;
	width: 30px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	background-color: white;
	color: black;
	font-weight: bold;
	border-radius: 30px;
	margin: 0 5px;
}

div.searchBox {
	padding: 20px;
}
</style>

</head>
<body>

	<div id="main_wrap">
		<!-- header 시작 -->
		<%@include file="../frame/header.jsp"%>
		<!-- header 끝 -->

		<div id="wrap">
			<h2>회원 리스트</h2>
			<div class="searchBox">
				<form>
					<select name="sType">
						<option value="both">아이디+이름</option>
						<option value="id">아이디</option>
						<option value="name">이름</option>
					</select> <input type="text" name="keyword"><input type="submit" value="검색">
				</form>
			</div>


			<table>
				<tr>
					<td>번호</td>
					<td>아이디</td>
					<td>비밀번호</td>
					<td>이름</td>
					<td>전화번호</td>
					<td>사진</td>
					<td>레벨</td>
					<td>가입날짜</td>
				</tr>

				<!-- table 행 반복 시작 -->
				
				<c:forEach items="${viewData.memberList }" var="list" varStatus="stat">
					<tr>
						<td>
							${list.idx } ${viewData.no-stat.index}
						</td>
						<td><a style="color: white" href="viewMem.do?id=${list.id }">${list.id }</a></td>
						<td>${list.pw }</td>
						<td>${list.name }</td>
						<td>${list.pNum }</td>
						<td><c:choose>
								<c:when test="${list.photoName eq 'none' }">
									<img style="width: 200px" alt="사진"
										src='<c:url value="/file/member_photo_upload/none.jpg"/>' />
								</c:when>
								<c:otherwise>
									<img style="width: 200px" alt="사진"
										src='<c:url value="/file/member_photo_upload/${list.photoName }"/>' />
								</c:otherwise>
							</c:choose></td>
						<td>${list.level }</td>
						<td><fmt:formatDate value="${list.registerDate }"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach> 

				<!-- table 행 반복 끝 -->
			</table>
			
			<c:if test="${viewData.listTotalCount>0 }">
				<div id="pagingBox">
					<c:forEach begin="1" end="${viewData.pageTotalCount }" var="num">
						<div>
							<a
								href="memberList?p=${num }&sType=${param.sType}&keyword=${param.keyword}">${num }</a>
						</div>
					</c:forEach>
				</div>
			</c:if>
		</div>
	</div>
	
</body>
</html>