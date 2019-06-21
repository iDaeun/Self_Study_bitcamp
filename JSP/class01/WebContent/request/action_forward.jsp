<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

응답페이지

<%
	request.setAttribute("code", "code-0");
	/* code = code-0 로 잘 들어옴 */
	
	//<jsp:param value="A-Type" name="type"/>
	//<jsp:param value='<%=request.getParameter("name")' name="name"/>
	
	//param을 이처럼 좀 더 간결하게 작성할 수 있다!
	request.setAttribute("name", request.getParameter("name"));
	request.setAttribute("type", "A-Type");
%>

</body>
</html>
<!-- 하나의 페이지에서 처리  -->
<jsp:forward page="form3_result.jsp"/>
