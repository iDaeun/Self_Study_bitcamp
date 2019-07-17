<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userData" class="library_model.UserInfo" scope="session"/>
<jsp:setProperty property="*" name="userData"/>
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
	<%=userData %>
</h1>

<jsp:forward page="viewMember.jsp"/>

</body>
</html>