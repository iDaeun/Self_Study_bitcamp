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
    
    /* 경로:http://localhost:9090/web/actiontag/page.jsp -> nullPointerException 방지 */
    if(pType == null){
    	pType = "a";
    }
    
    if(no == null){
    	no = "0";
    }
    
    if(uname == null){
    	uname = "noname";
    }
    
    if(pType.equals("a")){ %> <!-- 태그 -> java가 아니기 때문에 나눠줌 -->
    	<jsp:forward page="page_a.jsp">
    		<jsp:param value="<%= no%>" name="no"/>
    		<jsp:param value="<%= uname%>" name="uname"/>
    	</jsp:forward>
    <% } else if(pType.equals("b")){ %>
    	<jsp:forward page="page_b.jsp">
    	    <jsp:param value="<%= no%>" name="no"/>
    		<jsp:param value="<%= uname%>" name="uname"/>
    	</jsp:forward>
    <% } else{ %>
    	<jsp:forward page="page_c.jsp">
    	    <jsp:param value="<%= no%>" name="no"/>
    		<jsp:param value="<%= uname%>" name="uname"/>
    	</jsp:forward>
    <% } %>