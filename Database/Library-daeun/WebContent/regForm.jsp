<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width, initial-scale=1">
<title>Library Homepage</title>
<!-- boostrap연결 -->

<link rel="stylesheet" href="css/bootstrap.css">
<!-- css연결 -->
<link rel="stylesheet" href="cssFiles/default.css" type="text/css">

<!-- 구글폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Yeseva+One&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

<script>
	$(document).ready(function(){
		
		
		$('#id_check').click(function(){
			
			$('#idChkMsg').html("");
			
			$.ajax({
				
				url : 'regCheck.jsp',
				type : 'GET',
				data : {
					user_id : $('#user_id').val()
				},
				
				success : function(data){
					// 썜~~~~~~~~~~~~도와주세요~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!!!!!!!!!!!!!!
					if (data == 'N'){
						alert('regForm1'+ data);
						$('#idChkMsg').html('이미 사용중인 아이디 입니다');
						$('#idChkMsg').css('color', 'red');
						$("#submit").attr("disabled", true);
						
					} else if (data == 'Y') {
						alert('regForm2'+data);
						$('#idChkMsg').html('사용 가능한 아이디 입니다');
						$('#idChkMsg').css('color', 'blue');
						
					} else {
						alert('regForm3'+ data);
						$('#idChkMsg').html('뭔가 잘못됐다.!');
						
					}
					
				}
				
			});
		});
	});
</script>

</head>

<body>

	<div id="main_wrap">
		<!-- header 시작 -->
		<%@include file="frame/header.jsp"%>
		<!-- header 끝 -->

		<!-- nav 시작 -->
		<%@include file="frame/nav.jsp"%>
		<!-- nav 끝 -->

		<!-- context 시작 -->
		<div id="context">
			<div id="ct">
				<h1>회원가입</h1>

				<form action="regProcess.jsp" method="post">
					<table>
						<tr>
							<td>아이디</td>
							<td> <input type="text" name="user_id" id="user_id" value=""> 
								 <input type="button" value="중복아이디체크" id="id_check"><br>
								 <span id="idChkMsg"></span>
							</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="user_pw"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input	type="text" name="user_name"></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" value="회원가입" id="submit"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<!-- context 끝 -->

		<!-- footer 시작 -->
		<%@include file="frame/footer.jsp"%>
		<!-- footer 끝 -->
	</div>


</body>
</html>
