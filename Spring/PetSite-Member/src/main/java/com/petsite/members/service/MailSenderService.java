package com.petsite.members.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.petsite.members.dao.MemberDao;
import com.petsite.members.domain.MemberInfo;

@Service("mailSenderService")
public class MailSenderService {
	
	@Autowired
	private SqlSessionTemplate template;
	private MemberDao dao;
	@Autowired
	JavaMailSender sender;
	
	// verify값 변경
	public int changeVerify(String id) {
		
		dao = template.getMapper(MemberDao.class);
		
		int cnt = 0;
		cnt = dao.updateVerify(id);
		
		return cnt;		
	}
	
	// verify값 확인
	public int verify(String id) {
		
		dao = template.getMapper(MemberDao.class);
		
		int cnt = 0;
		MemberInfo memberInfo = null;
		
		memberInfo = dao.selectById(id);
		if(memberInfo != null && memberInfo.getVerify()=='Y') {
			
		}
		
		return cnt;
	}
	
	// 회원가입 -> 인증키 이메일 발송
	public int send(MemberInfo memberInfo) {
		
		MimeMessage message = sender.createMimeMessage();
		int cnt = 0;
		
		try {
			
			message.setSubject("[PET SITE]회원가입 인증키 발송 이메일 입니다", "UTF-8");
			String text = "<h1>인증키를 통해 회원가입을 완료해 주세요</h1>";
			text += "<a href=\"http://15.164.166.15:8080/psClient/keyVerify.html?code="+memberInfo.getCode()+"&id="+memberInfo.getId()+"\">인증하기</a><br>";
			text += "인증번호 : " + memberInfo.getCode();
			
			message.setText(text, "UTF-8", "html");
			message.setFrom(new InternetAddress("bitcamptestemail@gmail.com"));
			message.addRecipient(RecipientType.TO, new InternetAddress(memberInfo.getId(), "USER", "UTF-8"));
			
			sender.send(message);
			cnt = 1;
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return cnt;
	}
}
