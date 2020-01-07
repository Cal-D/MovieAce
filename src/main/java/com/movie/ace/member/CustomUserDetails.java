package com.movie.ace.member;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@SuppressWarnings("serial")
@Getter
@Setter
@ToString
public class CustomUserDetails implements UserDetails {

	private String member_id;
	private String member_email;
	private String member_name;
	private String member_pw;
	private String member_genres;
	private String member_birth;
	private String postcode;
	private String address;
	private String detailAddress;
	private String extraAddress;
	private String member_recent_login;
	private String member_recent_logout;
	private int member_no;
	
	//시큐리티 변수
	private String authority;
	private boolean enabled;
	
	@Override //유저의 권한을 저장하는 메소드
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		auth.add(new SimpleGrantedAuthority(authority));
		return auth;
	}

	@Override
	public String getPassword() {
		return member_pw;
	}

	@Override
	public String getUsername() {
		return member_id;
	}

	@Override //계정이 만료 되었는지 확인하는 메소드
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override //계정이 잠겼는지 확인하는 메소드
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override //계정 비밀번호가 만료되었는지 확인
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override //계정 활성화 여부 확인
	public boolean isEnabled() {
		return enabled;
	}

}
