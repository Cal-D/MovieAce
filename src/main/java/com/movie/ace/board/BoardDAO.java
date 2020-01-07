package com.movie.ace.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.movie.ace.board.ReplyVO;

@Service
public class BoardDAO implements BoardMapper {
 
	@Inject
	SqlSession SqlSession;

	// 게시글 쓰기
	@Override
	public void create(BoardVO vo) throws Exception {
		String mboard_title = vo.getMboard_title();
		String mboard_content = vo.getMboard_content();
		

		mboard_title = mboard_title.replace("<", "&lt;");
		mboard_title = mboard_title.replace("<", "&gt;");
		

		mboard_title = mboard_title.replace(" ", "&nbsp;&nbsp;");


		// 줄바꿈 문자처리 content = content.replace("\n", "<br>"); vo.setTitle(title);
		vo.setMboard_content(mboard_content);

		System.out.println(mboard_title);
		System.out.println(mboard_content);
		String board_sort = vo.getBoard_sort();
		
		if(board_sort.equals("공지사항")) {
			SqlSession.insert("board.notice_insert", vo);
		}else if(board_sort.equals("영화게시판")) {
			SqlSession.insert("board.insert", vo);			
		}else if(board_sort.equals("자유게시판")) {
			
		}else if(board_sort.equals("문의게시판")) {
			
		}else {
			SqlSession.insert("board.insert", vo);
		}
	}

	@Override
	public BoardVO change(int bno) throws Exception {
		return SqlSession.selectOne("board.change", bno);
	}

	// 게시글 상세보기
	@Override
	public BoardVO read(int bno) throws Exception {
		return SqlSession.selectOne("board.view", bno);
	}

	// 게시글 수정
	@Override
	public void update(BoardVO vo) throws Exception {
		SqlSession.update("board.update", vo);
	}

	// 게시글 삭제
	@Override
	public void delete(int bno) throws Exception {
		SqlSession.delete("board.deleteArticle", bno);
	}

	// 게시글 전체 목록
	@Override
	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		System.out.println(start);
		System.out.println(end);

		return SqlSession.selectList("board.listAll", map);
	}
	//공지사항 목록
	public List<BoardVO> noticeAll() throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		return sqlSession.selectList("board.noticeAll", map);
	}
	
	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return SqlSession.selectOne("board.countArticle", map);
	}

	//조회수 증가지연처리
	@Override
	public void increaseViewcnt(int bno, HttpSession session) throws Exception {

		long update_time = 0;
		if (session.getAttribute("update_time_" + bno) != null) {
			update_time = (Long) session.getAttribute("update_time_" + bno);
		}
		long current_time = System.currentTimeMillis();
		
		System.out.println("업데이트시간 : " + update_time);
		System.out.println("최신시간 : " + current_time);
		if (current_time - update_time > 5000 * 1000) {
			SqlSession.update("board.increaseViewcnt",bno);
			session.setAttribute("update_time_" + bno, current_time);
		}
	}
	
	
	//좋아요부분
	@Override
	public void mboard_like(BoardVO vo, HttpSession session) throws Exception {
		long like_update_time = 0;
		/* session.removeAttribute("like_current_time"); */
		
		if (session.getAttribute("like_current_time") != null) {
			like_update_time = (Long) session.getAttribute("like_current_time");
		}
		long current_time = System.currentTimeMillis();

		System.out.println("업데이트시간 : " + like_update_time);
		System.out.println("최신시간 : " + current_time);
		System.out.println(current_time - like_update_time);
		if (current_time - like_update_time > 360 * 1000) {
			 SqlSession.update("board.mboard_like", vo);
			session.setAttribute("like_current_time", current_time);
		}
	}
	
	@Override
	public void mboard_report(BoardVO vo) throws Exception{
		SqlSession.update("board.mboard_report", vo);
	}
	
	//---------------댓글 부분------------------------------------
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<ReplyVO> listReply(Integer bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.listReply", bno);
	}

	@Override
	public void createReply(ReplyVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert("board.insertReply",vo);
	}

	@Override
	public void updateReply(ReplyVO vo) {
		// TODO Auto-generated method stub
	}

	@Override
	public void deleteReply(Integer mboard_no) {
		SqlSession.delete("board.deleteReply", mboard_no);	
		}
	
	//----------------관리자 페이지 부분----------------------------
	@Override
	public List<BoardVO> reportlistAll(int start, int end){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		System.out.println(start);
		System.out.println(end);

		return SqlSession.selectList("board.reportlistAll", map);
	}
	
	@Override
	public int reportCount() {
		Map<String, String> map = new HashMap<String, String>();
		
		return SqlSession.selectOne("board.reportCount", map);
	}
	
}
