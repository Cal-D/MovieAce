package com.movie.ace.member;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ModifyRequest {
	
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
	
	public boolean isPwEqualToCheckPw() {
		return pw.equals(checkPw);
	}
}
