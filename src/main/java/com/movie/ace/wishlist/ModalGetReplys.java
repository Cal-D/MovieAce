package com.movie.ace.wishlist;

import org.springframework.stereotype.Service;

@Service
public class ModalGetReplys {
	String member_id;
	String movie_reply;
	String moviecd;
	int member_no;
	String movie_rate;

	public ModalGetReplys() {
  
	}

	public ModalGetReplys(String member_id, String movie_reply, String moviecd, int member_no, String movie_rate) {
		super();
		this.member_id = member_id;
		this.movie_reply = movie_reply;
		this.moviecd = moviecd;
		this.movie_rate = movie_rate;
	}

	
	
	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMoviecd() {
		return moviecd;
	}

	public void setMoviecd(String moviecd) {
		this.moviecd = moviecd;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMovie_rate() {
		return movie_rate;
	}

	public void setMovie_rate(String movie_rate) {
		this.movie_rate = movie_rate;
	}

	public String getMovie_reply() {
		return movie_reply;
	}

	public void setMovie_reply(String movie_reply) {
		this.movie_reply = movie_reply;
	}

}
