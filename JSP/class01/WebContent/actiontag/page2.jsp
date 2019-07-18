<%@page import="users.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- ====== JSL ====== -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!-- 용도: select.jsp -> page jsp, A/B/C를 구별 => 각각 다른 응답처리해주는 역할! -->
    <!-- a forward -> page_a.jsp -->
    <!-- b forward -> page_b.jsp -->
    <!-- c forward -> page_c.jsp -->
    
<%-- <%
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
    %>  --%>
    
   	 <!-- ====== JSL ====== -->
   	 <!-- 
   	 	pType파라미터 값을 비교 null값을 비교
   	 	no 파라미터 값을 비교 null값을 비교
   	 	uname 파라미터 값을 비교 null값을 비교
   	  -->
   	  
   	<!-- null이나 공백입력시 -> 입력되는 내용 설정 -->
   	<c:set value="${param.type}" var="pageType" scope="request"/>
 	   	<c:if test="${pageType == null}">
	   		<c:set value="a" var="pageType" scope="request"/>  	
	    </c:if> 
    
    <c:set value="${param.no}" var="pNo" scope="request"/>
	    <c:if test="${pNo eq null or pNo == ''}">
	   		<c:set value="0" var="pNo" scope="request"/>  	
	    </c:if>
    
    <c:set value="${param.uname}" var="userName" scope="request"/>
	    <c:if test="${userName eq null or userName == ''}">
	   		<c:set value="noname" var="userName" scope="request"/>  	
	    </c:if>
    
    	<%-- <!-- 제대로 선택시 -> URL에 넣어서 이동  -->
     <c:if test="${pageType == 'a'}">
    	<c:set value="page_a.jsp" var="uri"/>
    </c:if>
  
    <c:if test="${pageType == 'b'}">
    	<c:set value="page_b.jsp" var="uri"/>
    </c:if>
    
    <c:if test="${pageType == 'c'}">
    	<c:set value="page_c.jsp" var="uri"/>
    </c:if>  --%>
    
   <jsp:forward page="page_${pageType}.jsp"/>
   
    	<!-- FORWARD로 이동함 -->
   <%--  <jsp:forward page="${uri}"/> --%>

	<!-- ==== choose ==== -->
<%--     <c:choose>
    	<c:when test="${pageType == 'a'}">
    		<c:set value="page_a.jsp" var="uri"/>
    	</c:when>
    	
    	<c:when test="${pageType == 'b'}">
    		<c:set value="page_b.jsp" var="uri"/>
    	</c:when>

    	<c:when test="${pageType == 'c'}">
    		<c:set value="page_c.jsp" var="uri"/>
    	</c:when>
    	
    	<c:otherwise>
    		<c:set value="page_a.jsp" var="uri"/>
    	</c:otherwise>
    </c:choose> --%>
    
<%--     <% 0


    
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

    <% } %> --%>