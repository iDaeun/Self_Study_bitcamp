<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="nav">
	<ul>
		<c:choose>
		
			<c:when test='${not empty loginInfo and loginInfo.id ne "admin1"}'>
			<!-- 로그인한 사용자 -->
			<li><a class="nav" href="">수업목록</a></li>
			<li><a class="nav" href="<c:url value='/member/myPage.do' />">마이페이지</a></li>
			</c:when>
			
			<c:when test='${loginInfo.id eq "admin1"}'>
			<!-- 관리자 -->
			<li><a class="nav" href="<c:url value='/admin/memList.do' />">회원 목록</a></li>
			<li><a class="nav" href="">수업 목록</a></li>
			</c:when>
			
			<c:otherwise>
			<!-- 로그인 안한 게스트 -->
			<li><a class="nav" href="<c:url value='/login/loginForm' />">로그인◀</a></li>
			<li><a class="nav" href="<c:url value='/reg/regForm' />">회원가입◀</a></li>
			<li><a class="nav" href="">수업목록</a></li>
			</c:otherwise>
			
		</c:choose>
	</ul>
</div>