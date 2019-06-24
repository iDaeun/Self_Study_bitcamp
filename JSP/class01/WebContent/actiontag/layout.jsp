<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	/* 바로 페이지 넘버 설정 */
	/* String ctgy = "2"; */
	
	String ctgy = request.getParameter("ctgy");
	if(ctgy==null){
		ctgy="1";
	}
	
%>
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
	#main_wrap{
		border: 1px solid black;
		width:800px;
		padding:10px;
		margin: 10px auto;
	}
	#wrap{
		overflow: hidden
	}
	#wrap>div{
		float:left;
	}
	#aside{
		height:200px;
	}
	#footer{
		border: 1px solid gray;
		height: 50px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
<div id="main_wrap">
	<div id="header">
		<h1>TITLE</h1>
	</div>
	<div id="wrap">
		<div id="menu">
			
			<!-- 파라미터로 전달하기: -->
			<jsp:include page="menu.jsp">
				<jsp:param value='<%=ctgy%>' name="ctgy"/>
			</jsp:include>
		</div>
		<div id="aside"></div>
	</div>
	<div id="footer"></div>
</div>
</body>
</html>