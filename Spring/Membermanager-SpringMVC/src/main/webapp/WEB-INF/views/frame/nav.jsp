<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="nav">
	<ul>
		<li><a href="<c:url value='/' />">홈</a></li>
		<li>
		<c:if test="${loginInfo eq null}">
		<a href="<c:url value='/member/login' />">▶로그인 </a>
		</c:if>
		<c:if test="${loginInfo ne null}">
		<a href="<c:url value='/member/logout.do' />">LOGOUT</a>
		</c:if>
		</li>
		<li><a href="<c:url value='/member/regist' />">▶회원가입</a></li>
		<li><a href="<c:url value='/member/mypage' />">▶MyPage1</a></li>
		<li><a href="<c:url value='/member/mypage/mypage.do' />">MyPage2</a></li>
		<li><a href="<c:url value='/member/memberList' />">▶회원리스트1</a></li>
		<li><a href="<c:url value='/member/memberList' />">▶회원리스트2</a></li>
	</ul>
</div>