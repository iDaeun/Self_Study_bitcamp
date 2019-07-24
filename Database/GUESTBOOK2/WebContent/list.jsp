<%@page import="guestbook.model.Message"%>
<%@page import="guestbook.model.MessageListView"%>
<%@page import="guestbook.service.GetMessageListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String pageNumberstr = request.getParameter("page");
	int pageNumber = 1; // 디폴트 페이지 넘버 = 1

	if (pageNumberstr != null) {
		pageNumber = Integer.parseInt(pageNumberstr);
	}

	// 핵심 처리할 서비스 객체 생성
	GetMessageListService service = GetMessageListService.getInstance();

	// 응답 데이터의 결과 
	MessageListView viewData = service.getMessageListView(pageNumber);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>

	div{
		border : 2px solid black;
		margin : 5px 0px;
		width : 300px;
	}

</style>
</head>
<body>

	<h3>방명록 글쓰기</h3>

	<form action="writeMessage.jsp" method="post">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="guestName"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>메세지</td>
				<td><textarea rows="3" clos="30" name="message"></textarea></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="등록"></td>
			</tr>
		</table>
	</form>

	<hr>
	<%
		if (viewData.isEmpty()) {
	%>
	<h3>등록된 메세지가 없습니다.</h3>
	<%
		} else {

			for (Message message : viewData.getMessageList()) {
	%>
	<div>
		메세지 번호 : <%=message.getId()%><br> 
		손님 이름 :	<%=message.getGuestName()%><br> 
		메세지 :<%=message.getMessage()%><br> 
		<a href="confirmDeletion.jsp?messageId=<%=message.getId()%>">삭제하기</a>
	</div>
	<%
		}
		}

		// [1] [2] [3] -- page 나눠주기
		for (int i = 1; i <= viewData.getPageTotalCount(); i++) {
	%>
		
		<!-- 해당 페이지로 이동 -->
		<a href="list.jsp?page=<%=i%>">[<%=i%>]</a>
	<%
		}
	%>


</body>
</html>