<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="<c:url value="/css/default.css"/>" rel="stylesheet"
	type="text/css">
<style>
</style>
</head>
<body>

	<!-- 해더 시작 -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	<!-- 해더 끝 -->

	<!-- 네비게이션 시작 -->
	<%@ include file="/WEB-INF/views/frame/nav.jsp"%>
	<!-- 네비게이션 끝 -->

	<!-- 컨텐츠 시작 -->
	<div id="contents">

		<c:if test="${code eq null}">
			<!-- 인증하지 않고 로그인 했을때  -->
			<h3>인증되지 않은 아이디입니다</h3>
			<button onclick="send('${id}')">인증 이메일 다시 보내기</button>
		</c:if>

		<c:if test="${code ne null}">
			<!-- 이메일 => 인증링크로 들어왔을때 -->
			<c:if test="${result>0}">
			<h3>인증되었습니다!</h3>
			</c:if>
			<c:if test="${result<0}">
			<h3>인증실패...</h3>
			</c:if>
		</c:if>

	</div>
	<!-- 컨텐츠 끝 -->


	<!-- 푸터 시작 -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
	<!-- 푸터 끝 -->

	<script>
		function send(id) {
			
			$.ajax({
				url : 'sendEmail',
				type : 'get',
				data : {id: id},
				success : function(data) {
					alert(data);
					
					if(data == 'SUCCESS'){
						alert('재전송 완료, 이메일을 확인해주세요!');
					} else {
						alert('재전송 실패');
					}
				}
			});
		}
	</script>

</body>
</html>