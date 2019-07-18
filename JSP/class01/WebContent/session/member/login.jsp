<%@page import="users.model.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 
    1. id / pw 데이터 받기
    2. id == pw 인증
    3. 세션에 사용자 데이터 저장 : 속성을 이용해서 데이터 저장
    4. 응답처리 : 로그인 되었습니다 or 로그인 실패 (이전 페이지로 이동)    
     -->
     
     <%
     	//사용자 요청에서 한글 처리
     	request.setCharacterEncoding("utf-8");
     %>
     
     <%
     
     // 1. id / pw 데이터 받기
     String id = request.getParameter("uId");
     String pw = request.getParameter("uPw");
     
  	 // 2. id == pw 인증
     boolean loginChk = false;
     
     // id값과 pw값이 같으면 로그인 인증처리
     if(id != null && pw != null && id.equals(pw)){
    	 // 같을 때: 세션에 사용자 데이터 저장, loginChk = true;
     	 // 3. 세션에 사용자 데이터 저장 : 속성을 이용해서 데이터 저장
    	 //session.setAttribute("loginId", id); //사용자가 로그인 했는지 여부 확인용
    	 
    	 // ---- class 활용 ----
    	 LoginInfo loginInfo = new LoginInfo(id);
    	 //loginInfo라는 Object 넣어주기
    	 session.setAttribute("LoginInfo", loginInfo);
    	 
    	 loginChk = true; 
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

	<!-- 4. 응답처리 : 로그인 되었습니다 or 로그인 실패 (이전 페이지로 이동) -->   
	<%
		if(loginChk){ %>
			<h1><%=id %>님 로그인 성공!</h1>
			<a href='loginChk.jsp'>loginChk</a>
		<%} else {%>
			<script>
				alert("아이디 또는 비밀번호를 확인해주세요!!");
				//location.href='loginForm.jsp';
				history.go(-1);
			</script>
	<%	} %>

</body>
</html>