<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setAttribute("name01", "requestData");
    	session.setAttribute("name01", "sessionData");
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

		request영역의 name01: ${name01} <br> <!-- requestData  -->
							<%= request.getAttribute("name01") %><br> <!-- sessionData  -->
		session영역의 name02: ${sessionScope.name01} <br>
		application영역의 name03: ${name01} <!-- requestData  --> <br>
		
		code 파라미터 : ${param.code} <br> <!-- 공백 -->
		code 파라미터 : <%=request.getParameter("code") %> <br> <!-- null -->
		
		contextPath: ${pageContext.request.contextPath} <br> <!-- /web -->
		contextPath: <%=request.getContextPath() %> <br> <!-- /web -->
		
		<a href="${pageContext.request.contextPath}/member/memberlist.jsp">경로1</a>
		<a href="<%=request.getContextPath() %>/member/memberlist.jsp">경로2</a>
		
	</h3>
</body>
</html>