package com.movie.ace.rate; 

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.movie.ace.search.SearchVO;

@RestController
@ResponseBody
@RequestMapping("/rate/*")
public class RateController {
		
	@Autowired
	private RateDAO rDAO;
	
	@RequestMapping(value = "setReply", method = RequestMethod.POST) 
	public int rateWrite(@ModelAttribute RateVO rateVO, HttpServletRequest req, HttpServletResponse res) {
		//modalwrite.setMovie_rate(5); // 평점 구현되면 여기도 받아와서, 구현해야한다.
		
		String mcode = req.getParameter("moviecd");
		int code = Integer.parseInt(mcode);		
		
		if(rDAO.CheckDB(code)!= 0) { //일단 moviedb에 존재 하는지 체크, 0이면 영화코드에 엮인 댓이 하나도 없는것이므로, 존재하지 않는것. 
			//moviedb에 영화코드가 있는경우
			rateVO.setMovie_reply(req.getParameter("movie_reply")); //req에서 댓글 가져와서 setting
			rateVO.setMoviecd(code); //movie code setting
			if(rDAO.checkBeforeInsert(rateVO) == 0) {
				rDAO.writeReply(rateVO, req, res); //댓글 작성
			return 1; 
			}
			System.out.println("여기를 들어와야 내가 의도한 대로 된다@#)(*#@()*#@()*#)(@*#)@)(#)");
			return -1;
		}
		else {
			//moviedb에 영화코드가 없는경우
			rDAO.insertMovieDB(rateVO); //일단 moviedb에 영화 정보들을 입력한다
			// sql상 moviecode로 fk 관계이기 때문에 moviecode가 없는경우 댓글을 읽어오지 않는다. 
			// 그래서 일단 moviecode외 정보를 삽입, 그 다음은 동일하게 댓글 삽입
			rateVO.setMovie_reply(req.getParameter("movie_reply"));
			rateVO.setMoviecd(code);
			rDAO.writeReply(rateVO, req, res);
			return 1;
		}				
		
	}
	
	
	@RequestMapping("getReply")
	public List<RateVO> rateShow(@ModelAttribute RateVO rateVO, HttpServletRequest req,HttpServletResponse res) {
		return rDAO.getreply(rateVO, req, res);
	}
	
}
