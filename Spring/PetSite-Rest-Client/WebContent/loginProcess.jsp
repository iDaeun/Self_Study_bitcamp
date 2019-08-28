<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%
	String id = request.getParameter("id");
	System.out.println("request.getParameter"+id);
	session.setAttribute("id", id);
	String id1 = (String) session.getAttribute("id");
	System.out.println("session.getAttribute"+id1);
%>