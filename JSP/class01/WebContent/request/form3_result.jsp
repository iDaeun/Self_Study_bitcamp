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

<h1>
	<!-- sendredirect -->
	type = <%=request.getParameter("type") %> <br>
	name = <%=request.getParameter("name") %> <br>
	code = <%= request.getAttribute("code") %> <br>
	<!-- forward -->
	request.setAttribute() -> name1 = <%= request.getAttribute("code") %> <br>
	request.setAttribute() -> type1 = <%= request.getAttribute("code") %> <br>
</h1>

</body>
</html>