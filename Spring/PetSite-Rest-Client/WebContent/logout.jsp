<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%
	session.removeAttribute("id");
	out.print("로그아웃 되었습니다.");
%>