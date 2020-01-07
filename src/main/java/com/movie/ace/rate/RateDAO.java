package com.movie.ace.rate;

import java.math.BigDecimal;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.ace.search.SearchVO;

@Service
public class RateDAO {
	@Autowired
	private SqlSession ss;
	
	private int msgCount;

	public void writeReply(RateVO rvo , HttpServletRequest req,HttpServletResponse res) {
		System.out.println("RDAO입니다");
		try {
			ss.getMapper(RateMapper.class).writeReply(rvo);		
			msgCount++;

		} catch (Exception e) {
			e.printStackTrace();
			
		}

	}
	
	public List<RateVO> getreply(RateVO rvo, HttpServletRequest req, HttpServletResponse res){
		List<RateVO> listreply = new LinkedList<RateVO>();
		msgCount = ss.getMapper(RateMapper.class).getReplyCount(rvo.getMoviecd()); //페이징용 카운트
		listreply = ss.getMapper(RateMapper.class).getReply(rvo.getMoviecd());		
		return listreply;
	}	
	
	public int CheckDB(int mcode) {
		int chk = ss.getMapper(RateMapper.class).checkDb(mcode); //영화코드로 엮여있는 댓글 갯수가 몇갠지 체크한다.
		return chk;
	}
	public void insertMovieDB(RateVO rvo) { //moviedb에 삽입한다. 
		ss.getMapper(RateMapper.class).insertMovieDB(rvo);
	}
	public int checkBeforeInsert(RateVO rvo) {
		int check = ss.getMapper(RateMapper.class).checkBeforeInsert(rvo);
		return check;
	}
}
