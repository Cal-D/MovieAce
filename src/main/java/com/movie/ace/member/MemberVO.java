package com.movie.ace.member;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	  
	private int member_no;
	private String member_id;
	private String member_email;
	private String member_name;
	private String member_pw;
	private String genres;
	private String member_birth;
	private String postcode;
	private String address;
	private String detailAddress;
	private String extraAddress;
	private String member_phone;
	private String member_recent_login;
	private String member_recent_logout;
	private String authority;
	private byte enabled;
	private String reg_date;
	
}
