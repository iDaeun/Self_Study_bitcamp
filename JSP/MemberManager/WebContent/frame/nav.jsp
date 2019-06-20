<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="nav">
	<ul>
		<!-- getContentPath = Content Root -->
		<li><a href="<%= request.getContextPath() %>">홈</a></li>
		<!-- 시스템에서 자동적으로 경로 설정해줌! -->
		<li><a href="<%= request.getContextPath() %>/member/login.jsp">로그인</a></li>
		<li><a href="<%= request.getContextPath() %>/member/memberRegForm.jsp">회원가입</a></li>
		<li><a href="#">회원리스트</a></li>
	</ul>
</div>