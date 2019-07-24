<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
</style>
</head>
<body>

	<h1>
		${viewData.messageTotalCount }<br>
		${viewData.currentPageNumber }<br>
		${viewData.messageList }<br>
		${viewData.pageTotalCount }<br>
		${viewData.messageCountPerPage }<br>
		${viewData.firstRow }<br>
		${viewData.endRow }<br>
		
	</h1>
	
	<c:if test="${viewData.messageTotalCount>0}">
	
	<c:forEach items="${viewData.messageList}" var="message">
	
	<div>
		메세지 번호 : ${message.id}<br> 
		손님 이름 :	${message.guestName}<br> 
		메세지 :${message.message}<br> 
		<a href="confirmDeletion.jsp?messageId=${message.id}">삭제하기</a>
	</div>
	
	</c:forEach>
	
	<c:forEach begin="" end="" step="1" var="num">
		<a href="guestList?page=">[${num}]</a>
	</c:forEach>
	
	</c:if>
</body>
</html>