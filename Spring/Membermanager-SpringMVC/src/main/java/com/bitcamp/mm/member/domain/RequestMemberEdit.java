package com.bitcamp.mm.member.domain;

import org.springframework.web.multipart.MultipartFile;

public class RequestMemberEdit {
	private int idx;
	private String uId;
	private String uPw;
	private String uName;
	private MultipartFile uPhoto;
	private String oldFile;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getuPw() {
		return uPw;
	}

	public void setuPW(String uPw) {
		this.uPw = uPw;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public MultipartFile getuPhoto() {
		return uPhoto;
	}

	public void setuPhoto(MultipartFile uPhoto) {
		this.uPhoto = uPhoto;
	}

	public String getOldFile() {
		return oldFile;
	}

	public void setOldFile(String oldFile) {
		this.oldFile = oldFile;
	}

	public MemberInfo toMemberInfo() {

		MemberInfo info = new MemberInfo();
		info.setIdx(idx);
		//info.setuId(uId);
		info.setuName(uName);
		info.setuPw(uPw);
		//info.setuPhoto(oldFile);

		return info;

	}

	@Override
	public String toString() {
		return "RequestMemberEdit [idx=" + idx + ", uId=" + uId + ", uPw=" + uPw + ", uName=" + uName + ", uPhoto="
				+ uPhoto + ", oldFile=" + oldFile + "]";
	}
	
	

}