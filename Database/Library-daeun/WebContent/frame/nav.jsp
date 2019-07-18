<%@page import="users.model.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
    <%
    LoginInfo loginInfo1 = null;
    loginInfo1 = (LoginInfo)session.getAttribute("login");
    %>
	
    <div id="nn">
            <ul class="nav navbar-nav" id="nav">
                
                <% if(loginInfo1 != null && loginInfo1.getUser_id().equals("admin1")){  %>
                <!-- ADMIN일때 -->
                        <li><a href="#">회원목록</a></li>
                        <li><a href="#">대출 도서 리스트</a></li>
                        <li><a href="#">신청 도서 리스트</a></li>
                        <li><a href="#">열람실 예약 현황</a></li>
                        <li><a href="#">소장 도서 리스트</a></li>
                
                <%} else if(loginInfo1 != null) { %>
                <!-- 사용자일때 -->
                <li><a class="nav">열람실신청</a></li>
                <li><a class="nav">건의사항</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">마이페이지<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">도서 대출/반납</a></li>
                        <li><a href="#">열람실 예약현황</a></li>
                        <li><a href="#">신청 도서</a></li>
                        <li><a href="#">내 작성글</a></li>
                        <li><a href="/lib/users/myPage/myPage.jsp">내 정보</a></li>
                    </ul>
                </li>
                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">도서<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">도서검색</a></li>
                        <li><a href="#">도서신청</a></li>
                    </ul>
                </li>
            
            <% } else { %>
                <!-- 로그인이 되어있지 않을때 -->
                <li><a href="/lib/users/loginLogout/loginForm.jsp" class="nav">로그인</a></li>
                <li><a href="/lib/users/reg/regForm.jsp" class="nav">회원가입</a></li>
                <li><a class="nav">건의사항</a></li>
                <li><a href="#">도서검색</a></li>
            <% } %>
            
            </ul>
        </div>