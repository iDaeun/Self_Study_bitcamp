<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
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
	
	<!-- 한글로 인코딩 할 수 있도록!! -->
	<%
		request.setCharacterEncoding("utf-8");
	%>
	
	<h1>요청 파라미터 출력</h1>
	<h3> request.getParameter()이용</h3>
	<ul>
		<li>name 파라미터: <%= request.getParameter("name") %></li>
		<li>address 파라미터: <%= request.getParameter("address") %></li>
		<%-- <li>pet 파라미터: <%= request.getParameter("pet") %></li> --%>
	</ul>
	
	<!-- 배열 받기 -->
	<h3>request.getParameterValues()이용</h3>
	<%
		String[] values = request.getParameterValues("pet");
		
		if(values != null && values.length>0){
	%>
	<ul>
		<%
			for(int i=0; i<values.length; i++){
		%>
		<li><%= values[i] %></li>
		<%
			}
		%>
	</ul>
		<%
			}
		%>
	
	<h3> request.getParameterNames()이용 </h3>
	<%
		/* 컬렉션이랑 비슷 */
		Enumeration params = request.getParameterNames();
		
		while(params.hasMoreElements()){
			/* Object -> String 형변환 */
			String pName = (String)params.nextElement();
	%>
		<%= pName %><br>
	<% } %>
	
	<h3> request.getParameterMap()이용 </h3>
	<%	Map parameterMap = request.getParameterMap();
		
		/* String타입의 배열로 형변환 */
		String[] nameParam = (String[])parameterMap.get("name");
		
		if(nameParam != null){
	%>		
		name = <%= nameParam[0] %>
	<%} %>		
</body>
</html>