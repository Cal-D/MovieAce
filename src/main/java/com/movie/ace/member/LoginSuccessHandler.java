package com.movie.ace.member;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
	
	private String loginId;
	private String defaultUrl;
	private String password;
	private String referer;
	
	@Inject
	private UserDetailsService userSer;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		String username = request.getParameter(loginId);
		System.out.println("username= "+username);
		
		String rawPassword = request.getParameter(password);
		System.out.println("rawPassword= "+rawPassword);
		
		//로그인 일시 업데이트
		((CustomUserDetailsService) userSer).updateLoginDate(username); 
		
		//유저 정보 세션에 저장
		mkUserInfo(username, rawPassword, request);
		//로그인 실패시 생성된 세션 제거
		clearAuthenticationAttributes(request);
		//상황에 따른 페이지 이동
		resultRedirectStrategy(request, response, authentication);
		
	}
	
	protected void mkUserInfo(String username, String rawPassword, HttpServletRequest request) {
		CustomUserDetails userInfo = ((CustomUserDetailsService) userSer).getUserInfo(username); 
		HttpSession session = request.getSession(true);
		session.setAttribute("userInfo", userInfo);
		session.setAttribute("rawPw", rawPassword);
		
		//이전 페이지 정보 가져오기
		referer = (String) session.getAttribute("referer");
		
	}
	
	protected void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session==null) return;
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
		//이전 페이지 세션 값 삭제
		session.removeAttribute("referer");
	}
	
	protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		if(savedRequest!=null) {//회원이 들어갈수 있는 게시판 요청시 이전페이지
            String targetUrl = savedRequest.getRedirectUrl();
            redirectStratgy.sendRedirect(request, response, targetUrl);
            
		}else if(referer != null && !referer.contains("signUp") && !referer.contains("loginPage")) {//직접 로그인 이용시 이전 페이지로 이동
			redirectStratgy.sendRedirect(request, response, referer);
			
		}else {//기본 메인페이지
            redirectStratgy.sendRedirect(request, response, defaultUrl);
        }	
	}
	

}
