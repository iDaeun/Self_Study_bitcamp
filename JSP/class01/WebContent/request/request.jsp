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
	table tr:last-child>td{
		text-align: center;
	}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<div id="main">
	<h1>request 테스트 폼</h1>
	<hr>
	<!-- action생략 가능 -> 생략했을때는 자기자신을 가리킨다! -->
	<form action="../request_result.jsp" method="post">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="uName" placeholder="please enter name"></td>
			</tr>
			<tr>
				<td>직업</td>
				<td>
					<!-- select에 name을 넣어서 => option의 value값을 보내줌 (무직, 직장인 등등) -->
					<select name="job">
						<option>선택하세요</option>
						<option>무직</option>
						<option>직장인</option>
						<option>대학생</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>관심분야</td>
				<td>
					독서 <input type="checkbox" name="hobby" value="독서"> 
					영화 <input type="checkbox" name="hobby" value="영화"> 
					게임 <input type="checkbox" name="hobby" value="게임"> 
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>