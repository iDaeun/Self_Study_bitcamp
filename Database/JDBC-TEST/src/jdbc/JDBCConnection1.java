package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCConnection1 {
   public static void main(String[] args) {

      // 1. 데이터베이스의 드라이버를 로드한다.
      // 2. 데이터베이스 연결

      // Connection 객체 생성
      Connection conn = null;
      
      // JDBC_url : MySQL
      String jdbcUrl = "jdbc:mysql://localhost:3306/project?serverTimezone=UTC";
      // USER
      String user = "bit";
      // PASSWORD
      String pw = "bit";

      try {
         // 1. 드라이버 로드
         Class.forName("com.mysql.jdbc.Driver");
         
         // 2. 데이터베이스 연결
         conn = DriverManager.getConnection(jdbcUrl, user, pw);
         
         System.out.println("데이터베이스 연결 성공.");
         
         // 3. 데이터베이스 연결 종료
         conn.close();
         
      } catch (ClassNotFoundException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }
}