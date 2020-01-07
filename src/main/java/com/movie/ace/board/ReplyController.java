package com.movie.ace.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {
	@Inject
	BoardMapper boardmapper;
		
	
	//좋아요
	@RequestMapping("mboard_like")
	public void mboard_like(@ModelAttribute BoardVO vo, HttpSession session) throws Exception {
		boardmapper.mboard_like(vo, session);
	}
	
	
	//신고하기
		@RequestMapping("mboard_report")
		public void mboard_report(@ModelAttribute BoardVO vo, HttpSession session) throws Exception {
			String member_id = (String) session.getAttribute("1");
			vo.setMember_id(member_id);
			boardmapper.mboard_report(vo);
		}
	
	
		//댓글 에 관한 부분 ----------------------------------------------------------
				//댓글 입력
	@RequestMapping("insertReply")
	public void insertReply(@ModelAttribute ReplyVO vo, HttpSession session) {
		String member_id = (String) session.getAttribute("1");
		vo.setMember_id(member_id);
		boardmapper.createReply(vo);
	}
		//댓글 목록(화면을 리턴)
	@RequestMapping("listReply")
	public ModelAndView listReply(@RequestParam int mboard_no, ModelAndView mav) {
		List<ReplyVO> list = boardmapper.listReply(mboard_no);
		mav.setViewName("listReply");
		mav.addObject("list", list);
		return mav;
	}
		//댓글 목록(Json방식으로 처리 데이터를 리턴)
	@RequestMapping("listreplyJson")
	@ResponseBody //리턴 데이터를 json으로 변환(생략 가능)
	public List<ReplyVO> listreplyJson(@RequestParam int mboard_no){
		List<ReplyVO> list = boardmapper.listReply(mboard_no);
		return list;
	}
			
}
