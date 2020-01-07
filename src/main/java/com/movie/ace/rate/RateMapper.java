package com.movie.ace.rate;

import java.util.List;


public interface RateMapper {

	public abstract void writeReply(RateVO rVO);
	public abstract List<RateVO> getReply(int mcode);
	public abstract int getReplyCount(int mcode);	
	public abstract int checkDb(int mcode);
	public abstract void insertMovieDB(RateVO rVO);
	public int checkBeforeInsert(RateVO rVO);
}
