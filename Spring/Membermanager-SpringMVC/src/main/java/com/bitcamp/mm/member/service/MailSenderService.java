package com.bitcamp.mm.member.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.bitcamp.mm.member.dao.MemberSessionDao;
import com.bitcamp.mm.member.domain.MemberInfo;

@Service("mailSenderService")
public class MailSenderService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	private MemberSessionDao dao;
	
	@Autowired
	private JavaMailSender sender;
	
	public int verify(String id) {
		int result = dao.verify(id);
		return result;
	}
	
	public MemberInfo getMemberInfo(String id) {
		dao = template.getMapper(MemberSessionDao.class);
		MemberInfo memberInfo = dao.selectMemberById(id);
		return memberInfo;
	}
	
	public int send(MemberInfo memberInfo) {
		
		MimeMessage message = sender.createMimeMessage();
		
		try {
			
			message.setSubject("회원가입 메세지", "UTF-8");
			String htmlMsg = "<h1>회원가입 츄카링~</h1>"
					+ "<a href=\"http://localhost:9090/mm/member/regCheck?code="+memberInfo.getCode()+"&id="+memberInfo.getuId()+" \">가입 인증하기</a><br>"
					+ "인증번호 :" + memberInfo.getCode();
			
			message.setText(htmlMsg, "UTF-8", "html");
			message.setFrom(new InternetAddress("ekdms2309@naver.com"));
			message.addRecipient(RecipientType.TO, new InternetAddress(memberInfo.getuId(), "USER", "UTF-8"));
			
			sender.send(message);
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 1;
	}
	
	
}
