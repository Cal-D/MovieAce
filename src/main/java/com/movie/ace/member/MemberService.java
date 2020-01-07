package com.movie.ace.member;

import java.util.List;

public interface MemberService {
	
	//회원가입
	void register(RegisterRequest regReq) throws Exception;
	
	//아이디 중복체크
	int idCheck(String id) throws Exception;
	
	//회원정보 수정
	void updateMember(ModifyRequest modReq)throws Exception;
	
	//임시 멤버 번호 체크
	MemberVO noCheck() throws Exception;
	
	//회원 리스트
	List<MemberVO> memberList(int start, int end) throws Exception;
	
	//회원 차단
	int blockMember(int mno);
		
	//회원 차단 해제
	int unlockMember(int mno);

	//회원 수 체크
	int memberCount();
	
	//차단 회원 수 체크
	int blackMemberCount();
	
	//차단 회원 수 체크
	List<MemberVO> blackMemberList(int start, int end);
}
