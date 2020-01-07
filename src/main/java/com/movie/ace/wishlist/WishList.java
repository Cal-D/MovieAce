package com.movie.ace.wishlist;
 
import org.springframework.stereotype.Service;

@Service
public class WishList {
	String duplicate;

	String member_no;
	String moviecd;
	String title;
	String director;
	String actor;
	String opendt;
	String runtime;
	String genre;
	String plot;
	String poster;
	String audiacc;
 
	public WishList() {
		// TODO Auto-generated constructor stub
	}

	public WishList(String duplicate, String member_no, String moviecd, String title, String director, String actor,
			String opendt, String runtime, String genre, String plot, String poster, String audiacc) {
		super();
		this.duplicate = duplicate;
		this.member_no = member_no;
		this.moviecd = moviecd;
		this.title = title;
		this.director = director;
		this.actor = actor;
		this.opendt = opendt;
		this.runtime = runtime;
		this.genre = genre;
		this.plot = plot;
		this.poster = poster;
		this.audiacc = audiacc;
	}

	public String getDuplicate() {
		return duplicate;
	}
	
	public void setDuplicate(String duplicate) {
		this.duplicate = duplicate;
	}
	public String getMember_no() {
		return member_no;
	}

	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}

	public WishList(String member_no, String moviecd, String title, String director, String actor, String opendt,
			String runtime, String genre, String plot, String poster, String audiacc) {
		super();
		this.member_no = member_no;
		this.moviecd = moviecd;
		this.title = title;
		this.director = director;
		this.actor = actor;
		this.opendt = opendt;
		this.runtime = runtime;
		this.genre = genre;
		this.plot = plot;
		this.poster = poster;
		this.audiacc = audiacc;
	}

	public String getMoviecd() {
		return moviecd;
	}

	public void setMoviecd(String moviecd) {
		this.moviecd = moviecd;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	public String getOpendt() {
		return opendt;
	}

	public void setOpendt(String opendt) {
		this.opendt = opendt;
	}

	public String getRuntime() {
		return runtime;
	}

	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getPlot() {
		return plot;
	}

	public void setPlot(String plot) {
		this.plot = plot;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getAudiacc() {
		return audiacc;
	}

	public void setAudiacc(String audiacc) {
		this.audiacc = audiacc;
	}

}
