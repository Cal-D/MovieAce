package com.movie.ace.rate;

import java.util.Date;

public class RateVO {
	
	private String director;
	private String movieNm;
	private String genres;
	private String thumnailURL;
	private String actors;
	private String plot;
	private String runtime;
	private String openDate;
	private int moviecd;
	
	private int member_no;
	private String member_id;
	
	private double movie_rate;
	private String movie_reply;
	private Date movie_reply_date;
	
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getMovieNm() {
		return movieNm;
	}
	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}
	public String getGenres() {
		return genres;
	}
	public void setGenres(String genres) {
		this.genres = genres;
	}
	public String getThumnailURL() {
		return thumnailURL;
	}
	public void setThumnailURL(String thumnailURL) {
		this.thumnailURL = thumnailURL;
	}
	public String getActors() {
		return actors;
	}
	public void setActors(String actors) {
		this.actors = actors;
	}
	public String getPlot() {
		return plot;
	}
	public void setPlot(String plot) {
		this.plot = plot;
	}
	public String getRuntime() {
		return runtime;
	}
	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}
	public String getOpenDate() {
		return openDate;
	}
	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}

	
	public int getMoviecd() {
		return moviecd;
	}
	public void setMoviecd(int moviecd) {
		this.moviecd = moviecd;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public double getMovie_rate() {
		return movie_rate;
	}
	public void setMovie_rate(double movie_rate) {
		this.movie_rate = movie_rate;
	}
	public String getMovie_reply() {
		return movie_reply;
	}
	public void setMovie_reply(String movie_reply) {
		this.movie_reply = movie_reply;
	}
	public Date getMovie_reply_date() {
		return movie_reply_date;
	}
	public void setMovie_reply_date(Date movie_reply_date) {
		this.movie_reply_date = movie_reply_date;
	}
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public RateVO() {
		
	}
	public RateVO(String director, String movieNm, String genres, String thumnailURL, String actors, String plot,
			String runtime, String openDate, int moviecd, int member_no, String member_id, double movie_rate,
			String movie_reply, Date movie_reply_date) {
		super();
		this.director = director;
		this.movieNm = movieNm;
		this.genres = genres;
		this.thumnailURL = thumnailURL;
		this.actors = actors;
		this.plot = plot;
		this.runtime = runtime;
		this.openDate = openDate;
		this.moviecd = moviecd;
		this.member_no = member_no;
		this.member_id = member_id;
		this.movie_rate = movie_rate;
		this.movie_reply = movie_reply;
		this.movie_reply_date = movie_reply_date;
	}

	
}
