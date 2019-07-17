package library_service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.ConnectionProvider;
import library_dao.LibraryDao;
import library_model.MemberInfo;

public class RegService {
	
	private RegService() {
	}
	
	private static RegService service = new RegService();
	public static RegService getInstance() {
		return service;
	}
	
	public int regInsert(MemberInfo memberInfo) {
		int rCnt = 0;
		
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			LibraryDao dao = LibraryDao.getInstance();
			
			rCnt = dao.regInsert(conn, memberInfo);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rCnt;
	}
}
