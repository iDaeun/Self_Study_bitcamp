<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    
    String ctgy = request.getParameter("ctgy");
    
    if(ctgy.equals("1")){
    %>
    
    	<ul>
    		<li>회사소개</li>
    		<li>회사위치</li>
    	</ul>
    
    <%} else if(ctgy.equals("2")){%>
    	
    	<ul>
    		<li>서비스소개</li>
    		<li>제품소개</li>
    	</ul>
    	
    <%}%>