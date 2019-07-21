<%@page import="StudyRoom.model.user"%>
<%@page import="StudyRoomService.RVservice"%>
<%@page import="StudyRoom.model.Study_room"%>
<%@page import="org.apache.tomcat.jni.Stdlib"%>
<%@page import="StudyRoomService.SeatNum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    		String user_id = (String)session.getAttribute("login");
    
    		RVservice service = RVservice.getInstance();
    		user user = service.SeatRV(user_id);
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- boostrap연결 -->
<link rel="stylesheet" href="../css/bootstrap.css">
<!-- css연결 -->
<link rel="stylesheet" href="../cssFiles/default.css" type="text/css">

<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Yeseva+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
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
		<h3>마이페이지</h3>
		
		좌석번호 : <%= user.getSeat_num() %><br>
		선택한 시간 : <%= user.getStudy_time() %><br>
		<a href="/lib/StudyRoom/RC.jsp">수정</a> <a href="/lib/StudyRoom/RD.jsp">삭제</a>
		
		</div>
		<!-- footer 시작 -->
		<%@include file="../frame/footer.jsp"%>
		<!-- footer 끝 -->
		
	</div>

</body>
</html>