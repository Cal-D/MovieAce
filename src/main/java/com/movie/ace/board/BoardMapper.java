package com.movie.ace.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.movie.ace.board.ReplyVO;


 
public interface BoardMapper {

		//게시글작성
	 public void create(BoardVO vo) throws Exception;
		//게시글상세보기
	public BoardVO read(int bno) throws Exception;
		//게시글 수정페이지
	public BoardVO change(int bno) throws Exception;
	
		//게시글 수정
	public void update(BoardVO vo) throws Exception;
		//게시글 삭제
	public void delete(int bno) throws Exception;
		//게시글 전체 목록
	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword) throws Exception;
	
		//공지사항 글
	public List<BoardVO> noticeAll() throws Exception;
	
		//게시글 조회
	public void increaseViewcnt(int bno, HttpSession session) throws Exception;
	
	public int countArticle(String searchOption, String keyword) throws Exception;
	
	//좋아요
	public void mboard_like(BoardVO vo, HttpSession session) throws Exception;
	
	//신고
	public void mboard_report(BoardVO vo) throws Exception;
	
	//공지사항 입력
	/* public void notice_insert(BoardVO vo) throws Exception; */
		
	
	//--------------댓글 부분----------------------------
	
	//댓글 목록
			public List<ReplyVO> listReply(Integer bno);
			//댓글 입력
			public void createReply(ReplyVO vo);
			//댓글 수정
			public void updateReply(ReplyVO vo);
			//댓글 삭제
			public void deleteReply(Integer mboard_no);
			
	//------------------신고글 관리----------------------------
	
	public List<BoardVO> reportlistAll(int start, int end) throws Exception;
	public int reportCount() throws Exception;
}
