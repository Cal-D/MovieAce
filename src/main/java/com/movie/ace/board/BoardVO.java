package com.movie.ace.board;

import java.util.Date;

public class BoardVO {
	private int mboard_no;			//글 번호
	private int member_no;			//회원번호
	private String member_id;		//회원아이디
	private String member_name;		//회원이름
	private int moviecd;			//영화코드
	private String mboard_title;	//글제목
	private String mboard_header;	//말머리
	private Date mboard_reg_date;	//작성일
	private int mboard_hit_cnt;		//조회수
	private String mboard_content;	//내용
	private int mboard_like_cnt;	//좋아요
	private int mboard_dislike_cnt;	//싫어요
	private int mboard_report_cnt;	//신고
	private int mboard_reply_cnt;	//댓글 갯수
	private String board_sort; //개시글 분류
	
	
	public BoardVO() {
		// TODO Auto-generated constructor stub
	}

	public int getMboard_no() {
		return mboard_no;
	}

	public void setMboard_no(int mboard_no) {
		this.mboard_no = mboard_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public int getMoviecd() {
		return moviecd;
	}

	public void setMoviecd(int moviecd) {
		this.moviecd = moviecd;
	}

	public String getMboard_title() {
		return mboard_title;
	}

	public void setMboard_title(String mboard_title) {
		this.mboard_title = mboard_title;
	}

	public String getMboard_header() {
		return mboard_header;
	}

	public void setMboard_header(String mboard_header) {
		this.mboard_header = mboard_header;
	}

	public Date getMboard_reg_date() {
		return mboard_reg_date;
	}

	public void setMboard_reg_date(Date mboard_reg_date) {
		this.mboard_reg_date = mboard_reg_date;
	}

	public int getMboard_hit_cnt() {
		return mboard_hit_cnt;
	}

	public void setMboard_hit_cnt(int mboard_hit_cnt) {
		this.mboard_hit_cnt = mboard_hit_cnt;
	}

	public String getMboard_content() {
		return mboard_content;
	}

	public void setMboard_content(String mboard_content) {
		this.mboard_content = mboard_content;
	}

	public int getMboard_like_cnt() {
		return mboard_like_cnt;
	}

	public void setMboard_like_cnt(int mboard_like_cnt) {
		this.mboard_like_cnt = mboard_like_cnt;
	}

	public int getMboard_dislike_cnt() {
		return mboard_dislike_cnt;
	}

	public void setMboard_dislike_cnt(int mboard_dislike_cnt) {
		this.mboard_dislike_cnt = mboard_dislike_cnt;
	}

	public int getMboard_report_cnt() {
		return mboard_report_cnt;
	}

	public void setMboard_report_cnt(int mboard_report_cnt) {
		this.mboard_report_cnt = mboard_report_cnt;
	}

	public int getMboard_reply_cnt() {
		return mboard_reply_cnt;
	}

	public void setMboard_reply_cnt(int mboard_reply_cnt) {
		this.mboard_reply_cnt = mboard_reply_cnt;
	}

	public String getBoard_sort() {
		return board_sort;
	}

	public void setBoard_sort(String board_sort) {
		this.board_sort = board_sort;
	}

	@Override
	public String toString() {
		return "BoardVO [mboard_no=" + mboard_no + ", member_no=" + member_no + ", member_id=" + member_id
				+ ", member_name=" + member_name + ", moviecd=" + moviecd + ", mboard_title=" + mboard_title
				+ ", mboard_header=" + mboard_header + ", mboard_reg_date=" + mboard_reg_date + ", mboard_hit_cnt="
				+ mboard_hit_cnt + ", mboard_content=" + mboard_content + ", mboard_like_cnt=" + mboard_like_cnt
				+ ", mboard_dislike_cnt=" + mboard_dislike_cnt + ", mboard_report_cnt=" + mboard_report_cnt
				+ ", mboard_reply_cnt=" + mboard_reply_cnt + ", board_sort=" + board_sort + ", getMboard_no()="
				+ getMboard_no() + ", getMember_no()=" + getMember_no() + ", getMember_id()=" + getMember_id()
				+ ", getMember_name()=" + getMember_name() + ", getMoviecd()=" + getMoviecd() + ", getMboard_title()="
				+ getMboard_title() + ", getMboard_header()=" + getMboard_header() + ", getMboard_reg_date()="
				+ getMboard_reg_date() + ", getMboard_hit_cnt()=" + getMboard_hit_cnt() + ", getMboard_content()="
				+ getMboard_content() + ", getMboard_like_cnt()=" + getMboard_like_cnt() + ", getMboard_dislike_cnt()="
				+ getMboard_dislike_cnt() + ", getMboard_report_cnt()=" + getMboard_report_cnt()
				+ ", getMboard_reply_cnt()=" + getMboard_reply_cnt() + ", getBoard_sort()=" + getBoard_sort()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}

	public BoardVO(int mboard_no, int member_no, String member_id, String member_name, int moviecd, String mboard_title,
			String mboard_header, Date mboard_reg_date, int mboard_hit_cnt, String mboard_content, int mboard_like_cnt,
			int mboard_dislike_cnt, int mboard_report_cnt, int mboard_reply_cnt, String board_sort) {
		super();
		this.mboard_no = mboard_no;
		this.member_no = member_no;
		this.member_id = member_id;
		this.member_name = member_name;
		this.moviecd = moviecd;
		this.mboard_title = mboard_title;
		this.mboard_header = mboard_header;
		this.mboard_reg_date = mboard_reg_date;
		this.mboard_hit_cnt = mboard_hit_cnt;
		this.mboard_content = mboard_content;
		this.mboard_like_cnt = mboard_like_cnt;
		this.mboard_dislike_cnt = mboard_dislike_cnt;
		this.mboard_report_cnt = mboard_report_cnt;
		this.mboard_reply_cnt = mboard_reply_cnt;
		this.board_sort = board_sort;
	}
	
	
	
}
