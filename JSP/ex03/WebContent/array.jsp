<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String[] city_array = { "서울", "부산", "대구", "인천", "광주", "울산"};
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
</style>
</head>
<body>
	<ul>
	<!-- 스크립트 요소들 간에는 중복 못함 -->
	<%
		for(int i=0; i<city_array.length; i++){
			if(i%2 ==0 ) {
				
	%>
		<li>
		<%= city_array[i] %>
		</li>		
	<%	
		}
	}
	%>
	</ul>
	
	<!-- 구구단 출력해보기 -->
	<ul>
	<%
		for(int i=2; i<10; i++){
			for(int j=1; j<10; j++){		
	%>
		<li>
		<%= i+"*"+j+"="+(i*j) %>
		</li>
	<%
			}%>
	<hr>
	<%		
		} 
	%>

	</ul>
</body>
</html>