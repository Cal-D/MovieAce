package com.movie.ace.member;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RegisterRequest {
	 
	private String email;
	private String id;
	private String name;
	private String pw;
	private String checkPw;
	private String birth;
	private String postcode;
	private String address;
	private String detailAddress;
	private String extraAddress;
	private String genres;
	private String agree;
	
	//임시 멤버 번호
	private int member_no;
	
	public boolean isPwEqualToCheckPw() {
		return pw.equals(checkPw);
	}
}
