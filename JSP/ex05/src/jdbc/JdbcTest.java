package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcTest {

	public static void main(String[] args) throws SQLException {
//		try {
//			Driver driver = new Driver();
//		} catch (SQLException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		} 
		//이렇게 안하고 forName으로 Driver클래스 사용가능!!
		
		try {
			//파라미터로 클래스의 경로를 넣어주기
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//드라이버 종류 :// 자기 아이피 : 포트번호 / 데이터베이스 이름
		//나의 컴퓨터의 mysql -> hr연결함
		String url = "jdbc:mysql://localhost:3306/hr";
		
		String user = "MySQL80";
		String pwd = "chayin831";
		
		//--- 연결하기 -> 이를 컨트롤하는 conn객체 리턴
		
		Connection conn = DriverManager.getConnection(url, user, pwd);
		//getConnection안에서 내부로직에 의해서 수행해야함 : 이때문에 위에서 Driver클래스를 등록한것!
		//ClassNotFoundException을 피하자~~
		
		if(conn != null) {
			System.out.println("연결성공");
		} else {
			System.out.println("연결실패");
		}
		
		//--- 구문객체 생성  -> 쿼리를 실행할 수 있음
		Statement stmt = conn.createStatement();
		
					//employees 테이블에서 모든 정보를 가져와라!
		String sql = "select * from employees";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		//rs에 데이터가 있으면: 
		while(rs.next()) {
			int employee_id = rs.getInt("employ_id");
			String first_name = rs.getString("first_name");
			int salary = rs.getInt("salary");
			
			System.out.println(employee_id +"//"+ first_name +"//"+ salary);
			
		}
		
		//닫아주기 : 만든 순서의 역순으로! (rs -> stmt -> conn)
		rs.close();
		stmt.close();
		conn.close();
		
	}

}
