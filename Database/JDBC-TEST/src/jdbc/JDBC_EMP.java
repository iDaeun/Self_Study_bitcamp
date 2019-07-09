package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBC_EMP {

	public static void main(String[] args) {

		Connection conn = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");
			System.out.println("오라클 데이터베이스 접속 완료");

			// sql문
			String sqlRead = "select * from emp order by deptno";
			String salUpdate = "update emp set sal = ? where ename = ?";
			String sqlSearch = "select * from emp where ename = ?";
			String sqlAllPrint = "select * from emp e, dept d where e.deptno = d.deptno order by e.deptno";

			// 전체출력
			System.out.println("**** 전체출력 ****");
			PreparedStatement pstmt = conn.prepareStatement(sqlRead);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println("EMPNO : " + rs.getInt(1));
				System.out.println("ENAME : " + rs.getString(2));
				System.out.println("JOB : " + rs.getString(3));
				System.out.println("MGR : " + rs.getInt(4));
				System.out.println("HIREDATE : " + rs.getString(5));
				System.out.println("SAL : " + rs.getInt(6));
				System.out.println("COMM : " + rs.getInt(7));
				System.out.println("DEPTNO : " + rs.getInt(8));
				System.out.println("==========================================");
			}

			System.out.println();

			// "SCOTT"사원의 급여 정보를 1000으로 바꾸기 (execute.update메소드)
			System.out.println("**** SCOTT 급여 업데이트 ****");
			PreparedStatement pstmt1 = conn.prepareStatement(salUpdate);
			pstmt1.setInt(1, 1000);
			pstmt1.setString(2, "SCOTT");
			int cnt = pstmt1.executeUpdate();

			if (cnt > 0) {
				System.out.println(cnt + "개 행이 적용됨");
			}

			System.out.println();

			// "SCOTT"이름으로 검색한 결과 출력 (select+where)
			System.out.println("**** SCOTT 정보 ****");
			PreparedStatement pstmt2 = conn.prepareStatement(sqlSearch);
			pstmt2.setString(1, "SCOTT");
			ResultSet rs1 = pstmt2.executeQuery();
			while (rs1.next()) {
				System.out.println("EMPNO : " + rs1.getInt(1));
				System.out.println("ENAME : " + rs1.getString(2));
				System.out.println("JOB : " + rs1.getString(3));
				System.out.println("MGR : " + rs1.getInt(4));
				System.out.println("HIREDATE : " + rs1.getString(5));
				System.out.println("SAL : " + rs1.getInt(6));
				System.out.println("COMM : " + rs1.getInt(7));
				System.out.println("DEPTNO : " + rs1.getInt(8));
			}

			System.out.println();

			// 모든 사원 정보를 출력하며 부서정보를 함께 출력 (join/subQ)
			System.out.println("**** 모든 사원 정보 ****");
			PreparedStatement pstmt3 = conn.prepareStatement(sqlAllPrint);
			ResultSet rs2 = pstmt3.executeQuery();

			while (rs2.next()) {
				System.out.println("EMPNO : " + rs2.getInt(1));
				System.out.println("ENAME : " + rs2.getString(2));
				System.out.println("JOB : " + rs2.getString(3));
				System.out.println("MGR : " + rs2.getInt(4));
				System.out.println("HIREDATE : " + rs2.getString(5));
				System.out.println("SAL : " + rs2.getInt(6));
				System.out.println("COMM : " + rs2.getInt(7));
				System.out.println("DEPTNO : " + rs2.getInt(8));
				System.out.println("DNAME : " + rs2.getString(10));
				System.out.println("LOC : " + rs2.getString(11));
				System.out.println("==========================================");
			}

			System.out.println();

			rs.close();
			pstmt.close();
			conn.close();
			System.out.println("**** 데이터베이스 종료 ****");

		} catch (ClassNotFoundException e) {

		} catch (SQLException e) {

		}
	}

}
