package surfing.mvc.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import surfing.mvc.dao.Dao;
import surfing.mvc.domain.MemberInfo;

@Controller
public class RegController {
	
	@Autowired 
	private Dao dao;
	
	@Inject
	private DataSource ds;
	
	// 회원가입 폼 요청
	@RequestMapping(value = "/reg/regForm")
	public String getRegForm() {
		
		// reForm.jsp로 이동
		return "reg/regForm";
	}
	
	// 회원가입 처리
	@RequestMapping(value = "/reg/regProcess", method = RequestMethod.POST )
	public String regProcess(MemberInfo memberInfo) {
		
		// DB저장
		Connection conn = null;
		int rCnt = 0;
		
		try {
			
			conn = ds.getConnection();
			rCnt = dao.insertMem(conn, memberInfo);
			System.out.println("회원가입"+rCnt);
			
		} catch (SQLException e) {
			// TODO: handle exception
		}
		
		//regProcess.jsp로 이동
		return "reg/regProcess";
	}
	
}
