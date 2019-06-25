<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	boolean chk = false;
	
	// 아이디 입력값 = 비밀번호 입력값 
	if(id.equals(pw)){
		//쿠키 생성 : 사용자 데이터를 저장
		Cookie c1 = CookieBox.createCookie("LOGIN", "SUCCESS", -1);
		response.addCookie(c1);
		Cookie c2 = CookieBox.createCookie("ID", id, -1);
		response.addCookie(c2);
	
		chk = true;
	}
%>
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

	<script>
		$(document).ready(function(){
			
			//"아이디 저장하기" -> 체크 눌렀는지 확인
			if($('#save').attr("checked","checked")){
				
				// 체크되어있는 상태라면 쿠키로 저장 (유효기간:1일)
				<%
				Cookie c3 = CookieBox.createCookie(id, id, 60*60*24);
				response.addCookie(c3);
				%>
				
				alert("아이디 저장함");
				
			} 
		});
	</script>

	<%
	 if(chk){
		 //로그인 했을때
		 out.println("<h1>로그인 되었습니다</h1>");
		 out.println("<a href='loginCheck.jsp'>loginCheck</a>");
	 } else {
		 //로그인 하지 않았을때
		 out.println("<script> alert('로그인실패'); history.go(-1); </script>");
	 }
	%>

</body>
</html>