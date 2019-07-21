<%@page import="member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- 용도: select.jsp -> page jsp, A/B/C를 구별 => 각각 다른 응답처리해주는 역할! -->
    <!-- a forward -> page_a.jsp -->
    <!-- b forward -> page_b.jsp -->
    <!-- c forward -> page_c.jsp -->
    
    <%
    /* getParameter -> return값 = *STRING!!!!* */
    String pType = request.getParameter("type");
    String no = request.getParameter("no");
    String uname = request.getParameter("uname");
    
    //속성 안에 객체를 담고 보내주기!!
    Member member = new Member(uname, pType, no);
    //페이지,request보여주기위해
    request.setAttribute("result", member);
    //session보여주기위해
    session.setAttribute("user", member);
    
    /* 경로:http://localhost:9090/web/actiontag/page.jsp -> nullPointerException 방지 */
    if(pType == null){
    	pType = "a";
    }
    
    if(no == null){
    	no = "0";
    }
    
    if(uname == null || uname.length()<1){
    	uname = "noname";
    }
    
    if(pType.equals("a")){ %> <!-- 태그 -> java가 아니기 때문에 나눠줌 -->
    	<jsp:forward page="page_a.jsp"/>
    	<!-- param을 통해서 보내줄 필요 없음! 위에서 setAttribute을 통해서 속성으로 객체를 담아줬기 때문~ -->

    <% } else if(pType.equals("b")){ %>
    	<jsp:forward page="page_b.jsp"/>

    <% } else{ %>
    	<jsp:forward page="page_c.jsp"/>

    <% } %>