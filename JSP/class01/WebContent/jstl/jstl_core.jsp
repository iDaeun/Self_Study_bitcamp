<%@page import="java.util.List"%>
<%@page import="member.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- taglib추가 -->
    <!-- core 태그 사용하기 -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%
    	List<Member> list = new ArrayList<Member>();
    
	
	    list.add(new Member("강다은1","kkang-11","000-000-0000"));
	    list.add(new Member("강다은2","kkang-12",null));
	    list.add(new Member("강다은3","kkang-13","000-000-0000"));
	    list.add(new Member("강다은4","kkang-14","000-000-0000"));
	    list.add(new Member("강다은5","kkang-15","000-000-0000"));
	    list.add(new Member("강다은6","kkang-16",null));
	    list.add(new Member("강다은7","kkang-17",null));
	    list.add(new Member("강다은8","kkang-18","000-000-0000"));
	    list.add(new Member("강다은9","kkang-19","000-000-0000"));
	    list.add(new Member("강다은0","kkang-10","000-000-0000"));
	    	
    	application.setAttribute("members", list);
    	
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	span.pNum{
		font-weight: bold;
		color: red;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>

	<c:url value="/member/list.jsp" var="uri_mList">
		<c:param name="pno">5</c:param>
	</c:url>

	<h3>단순출력: ${uri_mList}</h3>
	<h3>링크연동1:<a href="${uri_mList}">회원리스트1</a></h3>
	<h3>링크연동2:<a href='<c:url value="/member/list.jsp" />'>회원리스트2</a></h3>

	<c:set value="test" var="msg"/>
	msg: ${msg} <br>
	
	<c:if test="${msg eq 'test'}">
		msg의 문자열은 test와 같습니다.	
	</c:if>
	<br>
	
	<c:if test="${msg eq 'test'}" var="condition"/>
		결과값은: ${condition}

	<!-- 출력 태그 -->
	<!-- default="nono!"= 데이터 없을때 출력되는 부분 
		escape="false" => <span>값을 html으로 인식하겠다! == default로 설정한 내용임
	-->
	<br>
	<c:out value="${param.code}" escapeXml="false">
		<span style="color:red">b</span>
	</c:out>
	<hr>
	
	<h1>회원 리스트</h1>
	<table>
		<tr>
			<td>index/count</td>
			<td>이름</td>
			<td>아이디</td>
			<td>전화번호</td>
		</tr>
		
		<!-- 반복시키기 
		  - ApplicationScope생략하고 -> ${members}
		  - var : Member 객체 지칭, 요소 하나하나 집어넣음
		-->
		<c:forEach items="${members}" var="member" varStatus="status" begin="0" end="5">
		<tr>
			<td>${status.index}/${status.count}</td>
			<td>${member.name}</td>
			<td>${member.id}</td>
			<td>			
				<c:out value="${member.pNum}" escapeXml="false">
					<span class="pNum">none</span>
				</c:out>
			</td>
		</tr>
		</c:forEach>
		
		<c:forTokens items="강다은,010-8888-6666,서울" delims="," var="sel">
			${sel}<br>
		</c:forTokens>
	</table>

</body>
</html>