<%@page import="library_service.RegService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<!-- usebean - memberInfo.java에 데이터 저장 -->
<jsp:useBean id="member" class="library_model.MemberInfo"/>
<jsp:setProperty property="*" name="member" />

<%
	RegService service = RegService.getInstance();
	int rCnt = service.regInsert(member);
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width, initial-scale=1">
<title>Library Homepage</title>
<!-- boostrap연결 -->

<link rel="stylesheet" href="css/bootstrap.css">
<!-- css연결 -->
<link rel="stylesheet" href="cssFiles/default.css" type="text/css">

<!-- 구글폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Yeseva+One&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</head>
<body>

	<div id="main_wrap">
		<!-- header 시작 -->
		<%@include file="frame/header.jsp"%>
		<!-- header 끝 -->

		<!-- nav 시작 -->
		<%@include file="frame/nav.jsp"%>
		<!-- nav 끝 -->

		<!-- context 시작 -->
		<div id="context">
			<div id="ct">
				<%
					if (rCnt > 0) {
				%>
				<h1>
					회원가입 완료!<%=rCnt%>개 데이터 추가함
				</h1>
				<a href="<%=request.getContextPath()%>">메인페이지로 돌아가기</a>
				<%
					} else {
				%>
				<h1>회원가입 실패</h1>
				<a href="<%=request.getContextPath()%>">메인페이지로 돌아가기</a>
				<%
					}
				%>

			</div>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>

</body>
</html>