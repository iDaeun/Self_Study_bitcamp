<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	//JDBC_URL
	String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String pw = "tiger";

	try {

		//1. 드라이버 로드
		//Class.forName("oracle.jdbc.driver.OracleDriver");

		//2. DB 연결 : 커넥션
				
		//conn = DriverManager.getConnection(jdbcUrl, user, pw);
		
		// ** 커넥션 풀로 DB 연결
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		conn = DriverManager.getConnection(jdbcDriver); // ** 커넥션 풀 등록한것 불러오기 (DBCPInit.java)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
</style>
</head>
<body>
	
	<h1>■■■■ MAIN PAGE ■■■■</h1>
	<h1>EMP LIST</h1>
	<a href=insertForm.jsp>사원 정보 추가 입력</a> <br>
	<a href=deleteForm.jsp>사원 정보 삭제</a>
	<hr>
	<table>

		<tr>
			<td>사원번호</td>
			<td>사원이름</td>
			<td>사원직급</td>
		</tr>
		
		<!-- table 행 반복 시작 -->
		<%
			//3. statement 객체 생성
				stmt = conn.createStatement();

				//사원리스트를 구하기 위한 sql문 작성
				String sql = "select * from emp order by ename";

				//4. sql실행
				//select 결과 받기 
				rs = stmt.executeQuery(sql);

				//5. 결과 출력
				while (rs.next()) {
		%>
		
		<tr>
			<td><%=rs.getInt(1)%></td>
			<td><a href="viewEmp.jsp?empno=<%= rs.getInt("empno") %>"><%=rs.getString("ename")%></a></td>
			<td><%=rs.getString("job")%></td>
		</tr>
		<%
			}
		%>
		<!-- table 행 반복 끝 -->
	</table>


</body>
</html>

<%
	} catch (SQLException se) {
		se.printStackTrace();
	} finally {
		//6. 사용객체 close(): rs, stmt, conn
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (stmt != null) {
			try {
				stmt.close();
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