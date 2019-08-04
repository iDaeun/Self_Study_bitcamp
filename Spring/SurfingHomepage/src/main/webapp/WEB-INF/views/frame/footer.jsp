<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<script>
		function logout(){
			
			var con = confirm('로그아웃 하시겠습니까?');
			if(con){
				location.href="<c:url value='/member/logout.do'/>";
			}
		}
	</script>
	
<div id="footer">

	<c:choose>
		
			<c:when test='${not empty loginInfo and loginInfo.id ne "admin1"}'>
			<!-- 로그인한 사용자 -->
			<button onclick="logout();" >
				<a href="#">로그아웃</a>
			</button>
			<button>
				<a href="/SurfingHomepage/member/deleteMemForm.jsp">회원탈퇴</a>
			</button>
			</c:when>
			
			<c:when test='${loginInfo.id eq "admin1"}'>
			<!-- 관리자 -->
			<button onclick="logout();">
				<a href="#">로그아웃</a>
			</button>
			</c:when>
			
			<c:otherwise>
			<!-- 로그인 안한 게스트 -->
			<span style="float: right;">surfingHomepage</span>
			</c:otherwise>
			
		</c:choose>

</div>