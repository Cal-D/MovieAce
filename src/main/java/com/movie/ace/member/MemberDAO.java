package com.movie.ace.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("memberDAO")
public class MemberDAO {

	@Inject
	private SqlSessionTemplate sqlSession;
	
	//이메일로 조회
	public MemberVO selectByEmail(String email) {
		return (MemberVO) sqlSession.selectOne("member.selectByEmail", email);
	}
	
	//아이디로 조회
	public MemberVO selectById(String id) {
		return (MemberVO) sqlSession.selectOne("member.selectById", id);
	}
	
	//
	public Object loginCheck(String id) {
		return sqlSession.selectOne("member.loginCheck", id);
	}
	
	public void insertMember(RegisterRequest regReq) {
		sqlSession.insert("member.register", regReq);
		sqlSession.insert("authority", regReq);
	}
	
	public void updateMember(ModifyRequest modReq) {
		sqlSession.update("member.updateMember", modReq);
	}
	
	public int idCheck(String id) {
		return (int) sqlSession.selectOne("member.idCheck", id);
	}
	
	//임시 멤버번호 체크
	public MemberVO noCheck() {
		return (MemberVO) sqlSession.selectOne("member.noCheck");
	}
	//최근 로그인 업데이트
	public void updateLoginDate(String id) {
		sqlSession.update("member.updateLoginDate", id);
	}
	//최근 로그아웃 업데이트
	public void updateLogoutDate(String id) {
		sqlSession.update("member.updateLogoutDate", id);
	}
	
	//멤버 리스트
	public List<MemberVO> memberList(int start, int end){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("member.memberList", map);
	}
	
	//회원 차단
	public int blockMember(int mno) {
		return sqlSession.update("member.blockMember", mno);
	}

	//회원 차단 해제
	public int unlockMember(int mno) {
		return sqlSession.update("member.unlockMember", mno);
	}

	//회원 수 체크
	public int memberCount() {
		return sqlSession.selectOne("member.memberCount");
	}

	//차단 회원 수 체크
	public int blackMemberCount() {
		return sqlSession.selectOne("member.blackMemberCount");
	}

	//차단 회원 리스트
	public List<MemberVO> blackMemberList(int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("member.blackMemberList", map);
	}
}
