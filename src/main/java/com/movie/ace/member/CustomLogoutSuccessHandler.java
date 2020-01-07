package com.movie.ace.member;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

public class CustomLogoutSuccessHandler implements LogoutSuccessHandler{

	@Inject
	UserDetailsService userSer;
	
	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		
		if (authentication != null && authentication.getPrincipal() != null) {
            try {
            	HttpSession session = request.getSession();
            	CustomUserDetails cud = (CustomUserDetails) session.getAttribute("userInfo");
            	String id = cud.getMember_id();
        		//로그아웃 날짜 DB저장
            	((CustomUserDetailsService) userSer).updateLogoutDate(id); 
        		
            } catch (Exception e) {
                e.printStackTrace();
            }finally {
            	//세션 삭제
            	request.getSession().invalidate();
            }
        } 
		response.sendRedirect("/");
	}

}
