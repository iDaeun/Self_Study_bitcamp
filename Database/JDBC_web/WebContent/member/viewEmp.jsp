<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String empno = request.getParameter("empno");
	//int eno = Integer.parseInt("empno");
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
		conn = DriverManager.getConnection(jdbcUrl, user, pw);
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

	<h1>EMP LIST</h1>
	<hr>

	<%
		//3. statement 객체 생성
			stmt = conn.createStatement();

			//사원리스트를 구하기 위한 sql문 작성 (=완성되어있는 sql문자열, 위에서 parseInt할 필요 없음)
			String sql = "select * from emp where empno=" + empno;

			//4. sql실행
			//select 결과 받기 
			rs = stmt.executeQuery(sql);

			//5. 결과 출력 : 데이터가 하나 들어오기 때문에 while문 대신 if문 사용!!!!!!
			if (rs.next()) {
	%>
			<ul>
				<li>사원번호: <%=rs.getInt("empno") %></li>
				<li>사원이름: <%=rs.getString("ename") %></li>
				<li>사원직무: <%=rs.getString("job") %></li>
				<li>사원급여: <%=rs.getInt("sal") %></li>
			</ul>

	<%
		}
	%>
			<a href="empList.jsp">EMP LIST</a>


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