package com.bitcamp.guest.service;

public class MessageNotFoundException extends Exception {

	// 직접 예외 클래스 만들기 -> Exception 상속을 통해서
	
	public MessageNotFoundException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}
	
}
