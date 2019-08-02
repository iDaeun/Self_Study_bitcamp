package com.bitcamp.mvc.domain;

import org.springframework.web.multipart.MultipartFile;

public class Report {
	
	private String sno;
	private MultipartFile report; // uploadForm이랑 이름을 똑같이 맞춰야함
	
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public MultipartFile getReport() {
		return report;
	}
	public void setReport(MultipartFile report) {
		this.report = report;
	}
	
	// 파일 사이즈 -> view에서는 EL로 출력
	public long getFileSize() {
		return report.getSize();
	}
	
	public String getFileName() {
		return report.getOriginalFilename();
	}
	
}
