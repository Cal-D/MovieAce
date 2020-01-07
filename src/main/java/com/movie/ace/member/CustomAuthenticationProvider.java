package com.movie.ace.member;

import javax.inject.Inject;

import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;

public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	@Inject
	private UserDetailsService userDeSer;
	@Inject
	private PasswordEncoder passwordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		String id = (String) authentication.getPrincipal();
		CustomUserDetails member = (CustomUserDetails) userDeSer.loadUserByUsername(id);
		String rawPassword = (String)authentication.getCredentials();
		String encPassword = member.getPassword();
		
		if(!passwordEncoder.matches(rawPassword, encPassword)) {
			//System.out.println("비밀번호 오류: "+id);
			throw new BadCredentialsException(id);			
			}
		if(!member.isEnabled() || !member.isCredentialsNonExpired()) {
			//System.out.println("잠금된 사용자: "+id);
			throw new AuthenticationCredentialsNotFoundException(id);
		}
		return new UsernamePasswordAuthenticationToken(id, encPassword, member.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

	
}
