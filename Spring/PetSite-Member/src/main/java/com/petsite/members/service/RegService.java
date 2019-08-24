package com.petsite.members.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.petsite.members.dao.MemberDao;
import com.petsite.members.domain.MemberInfo;

@Service("regService")
public class RegService {
	
	@Autowired
	private SqlSessionTemplate template;
	private MemberDao dao;
	
	public int memInsert(HttpServletRequest request, MemberInfo memberInfo) {
		
		dao = template.getMapper(MemberDao.class);
		
		// 사진 저장 경로
		String path = "/file";
		String dir = request.getSession().getServletContext().getRealPath(path);
		
		int rCnt = 0;
		String newFileName = "";
		
		if(memberInfo.getPic() != null) {
			newFileName = memberInfo.getId()+"_"+memberInfo.getPic_name();
			
			try {
				
				memberInfo.getPic().transferTo(new File(dir, newFileName));
				memberInfo.setPic_name(newFileName);
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		// DB저장
		rCnt = dao.insertMem(memberInfo);		
		
		return rCnt;
	}
}
