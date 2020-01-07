package com.movie.ace.search;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class SearchVO {

	private String director;
	private String movieNm;
	private String movieCd;
	private String genres;
	private String typeNm;
	private String thumnailURL;
	private String actors;
	private String plot;
	private String runtime;
	private String openDate;

	
	public String getOpenDate() {
		return openDate;
	}


	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}


	public String getRuntime() {
		return runtime;
	}


	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}


	public SearchVO() {
	}


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


	public String getMovieCd() {
		return movieCd;
	}


	public void setMovieCd(String movieCd) {
		this.movieCd = movieCd;
	}


	public String getGenres() {
		return genres;
	}


	public void setGenres(String genres) {
		this.genres = genres;
	}


	public String getTypeNm() {
		return typeNm;
	}


	public void setTypeNm(String typeNm) {
		this.typeNm = typeNm;
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


	public SearchVO(String director, String movieNm, String movieCd, String genres, String typeNm, String thumnailURL,
			String actors, String plot, String runtime, String openDate) {
		super();
		this.director = director;
		this.movieNm = movieNm;
		this.movieCd = movieCd;
		this.genres = genres;
		this.typeNm = typeNm;
		this.thumnailURL = thumnailURL;
		this.actors = actors;
		this.plot = plot;
		this.runtime = runtime;
		this.openDate = openDate;
	}

}
