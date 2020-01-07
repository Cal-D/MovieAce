package com.movie.ace.member;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;


public class CustomUserDetailsService implements UserDetailsService {
	
	@Inject
	private MemberDAO memberDAO;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		CustomUserDetails member = (CustomUserDetails) memberDAO.loginCheck(username);
		if(member==null) {
			throw new UsernameNotFoundException(username);
		}
		return member;
	}
	
	public CustomUserDetails getUserInfo(String username) {
		CustomUserDetails userInfo = (CustomUserDetails) memberDAO.loginCheck(username);
		return userInfo;
	}
	
	public void updateLoginDate(String username) {
		memberDAO.updateLoginDate(username);
	}
	
	public void updateLogoutDate(String username) {
		memberDAO.updateLogoutDate(username);
	}
	
}
