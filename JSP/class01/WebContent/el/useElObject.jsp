<%@page import="users.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	/* Member.java참조하여 객체 만들어서 활용 */
    	request.setAttribute("member", new Member("kkang", "kkangId", "0000"));
    
    	request.setAttribute("name01", "requestData");
    	session.setAttribute("name02", "sessionData");
    	application.setAttribute("name03", "applicationData");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<h3>
		<!-- name -> value 찾아오기 -->
		request영역의 name01: ${requestScope.name01} <br>
							<%= request.getAttribute("name01") %><br>
		session영역의 name02: ${sessionScope.name02} <br>
		application영역의 name03: ${applicationScope.name03} <br>
		
		<!-- EL로 객체 접근 -->
		member 객체 참조1 - id : ${requestScope.member.id } <br>
		<!-- reqiestScope = map / member = key /
		 Map.get("member") -> Member객체 반환 -->
		member 객체 참조2 - name : ${requestScope.member.name } <br>
		member 객체 참조3 - pNum : ${requestScope.member.pNum } <br>
		member 객체 참조4 - num : ${requestScope.member.num } <br>
		
		 
	</h3>
</body>
</html>