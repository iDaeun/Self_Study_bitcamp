<%@page import="surfing.model.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    //세션에 저장되어있는 로그인ID를 반환
    //String userId = (String)session.getAttribute("loginId");
    
    // ---- class 활용 ----
    LoginInfo loginInfo = (LoginInfo)session.getAttribute("LoginInfo");
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

		<!-- // ---- class 활용 ---- -->
		<%
		if(loginInfo != null){
		%>	
		<h1><%=loginInfo.getName() %>님 로그인 상태 입니다.</h1>
		<h3>
			id = <%=loginInfo.getId() %> <br>
			nickname = <%=loginInfo.getNickname() %> <br>
			grade = <%=loginInfo.getGrade() %> <br>
			phoneNum = <%=loginInfo.getpNum() %> <br>
			photo = <%=loginInfo.getPhoto() %> <br>
		</h3>
		
		<%-- <%
		if(userId != null){
		%>	
		<h1><%=userId %>님 로그인 상태 입니다.</h1> --%>
		<a href="logout.jsp">로그아웃</a>
	<%
		} else {
	%>
		<script>
			alert('로그인 하셔야 볼 수 있는 페이지 입니다.\n 로그인 페이지로 이동합니다.');
			location.href='loginForm.jsp';
		</script>	
	<%
		}
	%>

</body>
</html>