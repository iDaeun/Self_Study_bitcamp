package com.bitcamp.mvc;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SecurityController {
	
	@Autowired
	private BCryptPasswordEncoder encoder; // Bean으로 추가했음
	@Autowired
	private AES256Util aesutil;
	
	@ResponseBody
	@RequestMapping("/encodepassword")
	public String bcript() {
		
		String str = "password"; // -> DB에 있는 비밀번호
		
		String encodingStr = encoder.encode(str); // 암호화 처리되어있는 문자열 리턴 -> 로그인할 때 비밀번호
		boolean result = encoder.matches(str, encodingStr); // 비밀번호 비교
		
		return str + " : " + encodingStr + "<br>" + "str=encodingStr -->" + result;		
	}
	
	@ResponseBody
	@RequestMapping("/encodepassword1")
	public String bcript1() {
		
		String str = "password";
		
		String encodingStr = Sha256.encrypt(str); // 암호화 처리
		String pw = "pass"; // 사용자가 새롭게 입력한 pw
		boolean result = encodingStr.equals(Sha256.encrypt(pw)); // 새롭게 받은 pw도 암호화 처리
		
		return str + " : " + encodingStr + "<br>"
				+ "encodingStr=pw -->"+result;		
	}
	
	@ResponseBody
	@RequestMapping("/encodepassword2")
	public String bcript2() throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		
		String str = "password";
		
		String encodingStr = aesutil.encrypt(str); // 암호화
		String decodingStr = aesutil.decrypt(encodingStr); // 복호화
		
		return str + " : " + encodingStr + " : " + decodingStr;		
	}
}
