package com.bitcamp.mvc;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MailSendController {
	
	@Autowired
	MailSender sender; // SimpleMessage
	
	@Autowired
	JavaMailSender javaMailSender; // MimeMessage
	
	@ResponseBody
	@RequestMapping("/mail/send")
	public String sendMail() {
		
		// 메일 내용 설정
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo("dnrvy6719@gmail.com");
		message.setSubject("[광고]임욱표가 단돈 10원 특가세일!");
		message.setText("이것은 메일 내용이래");
		message.setFrom("ekdms2309@naver.com");
		
		// 재사용
		SimpleMailMessage m = new SimpleMailMessage(message);
		
		sender.send(message);

		return "send OK";
	}
	
	@ResponseBody
	@RequestMapping("/mail/send2")
	public String sendJavaMailSender(){
		
		MimeMessage message = javaMailSender.createMimeMessage();
		try {
			// 메일 제목설정
			message.setSubject("처음보내는 JavaMailSender", "UTF-8");
			// html 메일 내용
			String htmlStr = "<h1 style=\"color:blue\">안냥안냥</h1><br>"
					+ "<a href=\"http://www.naver.com\">네이버</a>";
			// 내용 설정
			message.setText(htmlStr, "UTF-8", "html");
			// To 설정
			message.addRecipient(RecipientType.TO, new InternetAddress("dnrvy6719@gmail.com", "포크", "UTF-8"));
			
			javaMailSender.send(message);
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "send OK";
	}
	
	// 파일 첨부해서 전송
	@ResponseBody
	@RequestMapping("/mail/send3")
	public String sendFileAttach() {
		
		MimeMessage message = javaMailSender.createMimeMessage();
		
		try {
			
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			// 제목
			messageHelper.setSubject("[제목]욱표야 안뇽?");
			// 내용 html
			String htmlStr = "<h1>파일 다운받아!!!어서!!!</h1>";
			// 내용설정
			messageHelper.setText(htmlStr, true);
			// To 설정
			messageHelper.setTo(new InternetAddress("dnrvy6719@gmail.com", "포크", "UTF-8"));
			// 첨부할 파일 객체 생성
			DataSource dataSource = new FileDataSource("C:\\Users\\ekdms\\Desktop\\warm.gif"); //절대경로
			// MimeMessageHelper 파일 객체를 추가
			messageHelper.addAttachment(MimeUtility.encodeText("warm.gif", "UTF-8", "B"), dataSource);
			
			// 전송
			javaMailSender.send(message);
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "send OK";
	}
}
