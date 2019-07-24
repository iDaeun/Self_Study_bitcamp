<%@page import="guestbook.service.InvalidMessagePasswordException"%>
<%@page import="guestbook.service.MessageNotFoundException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="guestbook.service.DeleteMessageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    int messageId = Integer.parseInt(request.getParameter("messageId"));
    String password = request.getParameter("password");
    
    int resultCnt = 0;
    boolean chk = false; // 오류발생 -> false / 정상처리 -> true
    String msg = ""; // 출력하고자 하는 오류 메세지
    
    // 서비스 객체 생성
    DeleteMessageService service = DeleteMessageService.getInstance();
    
    try {
    resultCnt = service.deleteMessage(messageId, password);
   	chk = true;
    
    // 예외에 따라서 응답 메세지 다르게 처리 :
    } catch (SQLException e){
    	msg = e.getMessage();
    	
    } catch (MessageNotFoundException e){
    	msg = e.getMessage();
    	
    } catch (InvalidMessagePasswordException e){
    	msg = e.getMessage();
    	
    }
    
    
    %>
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
		<%
			if(chk){
		%>
			<%= resultCnt %> 개의 행이 삭제되었습니다.
		<%	} else { %>
			<%= msg %>
		<%	} %>
	</h1>
	
	<a href="list.jsp">리스트</a>



</body>
</html>