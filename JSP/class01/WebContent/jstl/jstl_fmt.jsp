<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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
		
		<!-- 태그를 활용하여 간단하게 표시할 수 있음 -->
		<c:set var="price" value="100000"/>
		<c:set var="pi" value="3.141592"/>
		
		<fmt:formatNumber value="${price}" type="number" var="numberType" groupingUsed="false"/>
		
		현재 숫자: ${numberType} <br>
		통화: <fmt:formatNumber value="${price}" type="currency" currencySymbol="\\"/><br>
		% 표현: <fmt:formatNumber value="${price}" type="percent" groupingUsed="false"/> /
		 <fmt:formatNumber value="${pi}" type="percent" groupingUsed="false"/> <br>
		패턴 표현: <fmt:formatNumber value="${price}" pattern="00,000,000.00"/> /
		 <fmt:formatNumber value="${pi}" pattern="00,000,000.00"/> <hr>
		
		<!-- formatDate태그 -->
		<c:set var="now" value="<%=new java.util.Date() %>"/>
		<fmt:formatDate value="${now}" type="date" dateStyle="full"/> /
		<fmt:formatDate value="${now}" type="date" dateStyle="short"/> <br>
		<fmt:formatDate value="${now}" type="time" timeStyle="full"/> /
		<fmt:formatDate value="${now}" type="time" timeStyle="short"/> <br>
		<fmt:formatDate value="${now}" type="both"/> /
		<fmt:formatDate value="${now}" type="both" timeStyle="full"/> /
		<fmt:formatDate value="${now}" type="both" timeStyle="short"/> <br>
		<fmt:timeZone value="HongKong"> <!-- 타임존 설정 -->
		<fmt:formatDate value="${now}" pattern="[yyyy년MM월dd일] a H:mm:ss"/>
		</fmt:timeZone>
	</h3>

</body>
</html>