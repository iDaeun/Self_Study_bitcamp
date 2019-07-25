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
	h5{
	border: 3px solid gray;
	}
	h1{
	text-align: center;
	}
</style>
</head>
<body>

	<h5>
		${viewData.messageTotalCount }<br>
		${viewData.currentPageNumber }<br>
		${viewData.messageList }<br>
		${viewData.pageTotalCount }<br>
		${viewData.messageCountPerPage }<br>
		${viewData.firstRow }<br>
		${viewData.endRow }<br>
		
	</h5>
	
	<h1>방명록</h1>
	<div style="text-align: center; font-size: 25px;"><a href="guestWriteForm">글쓰기</a></div>
	<br>
	
	<c:if test="${viewData.messageTotalCount>0}">
	
	<c:forEach items="${viewData.messageList}" var="message">
	
	<div style="text-align: center">
		메세지 번호 : ${message.id}<br> 
		손님 이름 :	${message.guestName}<br> 
		메세지 :${message.message}<br> 
		<a href="guestDelForm?messageId=${message.id}">삭제하기</a>
	</div>
	
	</c:forEach>
	</c:if>
	
	<h1>
	<c:forEach begin="1" end="${viewData.pageTotalCount }" step="1" var="num">
		<a href="guestList?page=${num}">[${num}]</a>
	</c:forEach>
	</h1>
	
</body>
</html>