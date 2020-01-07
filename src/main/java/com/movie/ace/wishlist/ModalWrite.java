package com.movie.ace.wishlist;
 
import org.springframework.stereotype.Service;
@Service
public class ModalWrite {

	String moviecd;
	String movie_reply;
	int member_no;
	String movie_rate;
	
	public ModalWrite() {
	
	}
	
 
	public ModalWrite(String moviecd, String movie_reply, int member_no, String movie_rate) {
		super();
		this.moviecd = moviecd;
		this.movie_reply = movie_reply;
		this.member_no = member_no;
		this.movie_rate = movie_rate;
	}

	public String getMoviecd() {
		return moviecd;
	}

	public void setMoviecd(String moviecd) {
		this.moviecd = moviecd;
	}

	public String getMovie_reply() {
		return movie_reply;
	}

	public void setMovie_reply(String movie_reply) {
		this.movie_reply = movie_reply;
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
	
	
	
}
