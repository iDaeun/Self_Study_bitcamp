<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		margin:0;
		padding:0;
	}
	#main{
		width: 960px;
		margin: 0 auto;
		padding: 50px;
	}
	h1{
		padding: 15px;
	}
	table{
		margin: 0 auto;
		margin-top: 30px;
		width: 500px;
		border: 0;
		border-collapse: collapse;
	}
	td{
		border: 1px solid black;
		padding: 15px;
	}
	select{
		height: 25px;
	}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<%request.setCharacterEncoding("utf-8"); %>
	<div id="main">
	<h1>request결과</h1>
	<hr>
	<table>
		<tr>
			<td>이름</td>
			<td>
				<%String name = request.getParameter("uName");
					if(name == null){
						name = ">>이름 미입력";
					}%> 
				<%=name %>
			</td>
		</tr>
		<tr>
			<td>직업</td>
			<td>
				<%String job =  request.getParameter("job"); 
					if(job.equals("선택하세요")){
						job = ">>직업 미선택";
					}%>
				<%=job %>	
			</td>
		</tr>
		<tr>
			<td>관심분야</td>
			<td>
				<%
				String[] hobby = request.getParameterValues("hobby");
				if(hobby != null && hobby.length>0){
					for(int i=0; i<hobby.length; i++){%> 
					<!-- 브라우저는 탭이나 스페이스 아무리해도 안먹힘, 스페이스 한칸만 먹힘 -->
					<!-- 해결: /n => <br>태그를 써줘야함!!! -->
					<%= "["+hobby[i]+"]"+"<br>"%> 
					<%}%> <%}%>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>