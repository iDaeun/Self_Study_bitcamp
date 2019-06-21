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

	<%	
		/* pageContext.getRequest() => 상위임 ==> HttpServletRequest으로 형변환 */
		HttpServletRequest req = (HttpServletRequest)pageContext.getRequest();
	%>
	<!-- request기본객체와 pageContext.getRequest() 동일한지?? -->
	<%= request == req %>
	
	<br>
	<%
	/* 둘 다 같이 출력하는 기능임 */
	out.print(123+"<br>");
	pageContext.getOut().print("같은 객체를 사용합니다.");
	%>

</h1>

</body>
</html>