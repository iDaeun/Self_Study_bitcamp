<%@page import="library_model.memberInfo"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 자바빈 사용 -->
    <jsp:useBean id="member" class="library_model.memberInfo"/>
	<jsp:setProperty property="*" name="member"/>
    
    <%
    request.setCharacterEncoding("utf-8");
    
/*     String empno = request.getParameter("empno");
    String ename = request.getParameter("ename");
    String job = request.getParameter("job"); */
    
    //데이터베이스에 넣기 위해 타입을 맞춰줘야함(int로)
    //int eno = Integer.parseInt(empno);
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    int resultCnt = 0;
    
    try {
    //1.데이터베이스 로드
    //Class.forName("oracle.jdbc.driver.OracleDriver");
    
    //2.데이터베이스 연결
    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
    
    //3.PreparedStatement 생성
    //사용자 정보 업데이트를 위한 sql작성 (외부에서 입력받을 데이터는 ?으로 치환)
    String sql = "insert into emp (empno, ename, job) values (?,?,?)";
    //preparedstatment 객체 생성
    pstmt = conn.prepareStatement(sql);
    //파라미터로 전달받은 외부값 넣기
    pstmt.setInt(1, member.getEmpno()); //자바빈 -> memberinfo.java
    pstmt.setString(2, member.getEname());
    pstmt.setString(3, member.getJob());
    //실행결과 int값으로 받기
    resultCnt = pstmt.executeUpdate();
    
    //4.SQL 실행
    //5.실행결과 출력 : 수정되었습니다
    } catch (SQLException se){
    	
    } finally {
    //6.객체close
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
</style>
</head>
<body>
	<h1>사원정보 추가</h1>
	<h3><%=resultCnt %>개 행이 추가되었습니다</h3>
	<a href="empList.jsp">EMP LIST</a>
</body>
</html>