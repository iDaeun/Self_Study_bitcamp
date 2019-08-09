package com.surfing.mvc.member.service;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.surfing.mvc.jdbc.ConnectionProvider;
import com.surfing.mvc.member.dao.Dao;
import com.surfing.mvc.member.domain.MemberInfo;

@Service("regService")
public class RegService implements SurfingService {

	@Autowired
	private Dao dao;

	/*
	 * @Inject private DataSource ds;
	 */

	public int reg(MemberInfo memberInfo, HttpServletRequest request) {
		
		String path = "/file/member_photo_upload";
		//Connection conn = null;
		int rCnt = 0;
		
		// 파일 저장
		String dir = request.getSession().getServletContext().getRealPath(path);
		MultipartFile photo = memberInfo.getPhoto();
		
		if(!photo.isEmpty()&&photo.getSize()>0) {
			try {
				photo.transferTo(new File(dir,memberInfo.getId()+"_"+photo.getOriginalFilename()));
				memberInfo.setPhotoName(memberInfo.getId()+"_"+photo.getOriginalFilename());
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		// DB 저장
		//try {
			
			//conn = ds.getConnection();
			
			//conn = ConnectionProvider.getConnection();
			//rCnt = dao.insertMem(conn, memberInfo);
			rCnt = dao.insertMem(memberInfo);
			System.out.println("회원가입" + rCnt);
			
		//} catch (SQLException e) {
		//	e.printStackTrace();
		//}
		
		return rCnt;
	}
}
