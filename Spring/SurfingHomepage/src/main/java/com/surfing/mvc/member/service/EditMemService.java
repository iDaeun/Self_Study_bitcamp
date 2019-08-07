package com.surfing.mvc.member.service;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.surfing.mvc.jdbc.ConnectionProvider;
import com.surfing.mvc.member.dao.Dao;
import com.surfing.mvc.member.domain.MemberInfo;

@Service("editMemService")
public class EditMemService {

	@Autowired
	private Dao dao;

	public int updateMem(MemberInfo memberInfo, HttpServletRequest request) {

		String path = "/file/member_photo_upload";
		Connection conn = null;
		int rCnt = 0;
		
		System.out.println(memberInfo.getPhotoName());

		// 파일 저장
		String dir = request.getSession().getServletContext().getRealPath(path);
		MultipartFile photo = memberInfo.getPhoto();

		if (!photo.isEmpty() && photo.getSize() > 0) {
			try {
				photo.transferTo(new File(dir, memberInfo.getId() + "_" + photo.getOriginalFilename()));
				memberInfo.setPhotoName(memberInfo.getId() + "_" + photo.getOriginalFilename());
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} 
		
		// DB저장
		try {
			
			conn = ConnectionProvider.getConnection();
			rCnt = dao.updateMem(conn, memberInfo);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rCnt;
	}
}
