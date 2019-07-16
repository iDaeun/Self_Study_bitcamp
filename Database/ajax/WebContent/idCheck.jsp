<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page trimDirectiveWhitespaces="true" %> 
<%
	String uId = request.getParameter("uId");
 	//out.print(uId);
 	
 	/* (1-1) uId가 admin일때 Y, 아닐때 N으로 바꾸고 -> 응답 text (페이지소스에서 확인가능) */
 	if(!uId.equals("admin")){
 		out.print("Y");
 	} else {
 		out.print("N");
 	}
%>