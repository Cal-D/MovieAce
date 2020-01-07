package com.movie.ace.board;

import java.util.Date;

public class ReplyVO {
		private int mboard_rno;				//댓글번호
		private int moviecd;				//영화코드
		private int mboard_no;				//게시글번호
		private String member_id;		//회원아이디
		private String mreply_content;		//댓글내용
		private int mreply_like_cnt;		//댓글좋아요
		private int mreply_dislike_cnt;		//댓글싫어요
		private int mreply_report_cnt;		//댓글신고
		private int member_no;				//회원번호
		private String mreply_reg_date;		//작성일
		
		public ReplyVO() {
			// TODO Auto-generated constructor stub
		}

		public int getMboard_rno() {
			return mboard_rno;
		}

		public void setMboard_rno(int mboard_rno) {
			this.mboard_rno = mboard_rno;
		}

		public int getMoviecd() {
			return moviecd;
		}

		public void setMoviecd(int moviecd) {
			this.moviecd = moviecd;
		}

		public int getMboard_no() {
			return mboard_no;
		}

		public void setMboard_no(int mboard_no) {
			this.mboard_no = mboard_no;
		}

		public String getMember_id() {
			return member_id;
		}

		public void setMember_id(String member_id) {
			this.member_id = member_id;
		}

		public String getMreply_content() {
			return mreply_content;
		}

		public void setMreply_content(String mreply_content) {
			this.mreply_content = mreply_content;
		}

		public int getMreply_like_cnt() {
			return mreply_like_cnt;
		}

		public void setMreply_like_cnt(int mreply_like_cnt) {
			this.mreply_like_cnt = mreply_like_cnt;
		}

		public int getMreply_dislike_cnt() {
			return mreply_dislike_cnt;
		}

		public void setMreply_dislike_cnt(int mreply_dislike_cnt) {
			this.mreply_dislike_cnt = mreply_dislike_cnt;
		}

		public int getMreply_report_cnt() {
			return mreply_report_cnt;
		}

		public void setMreply_report_cnt(int mreply_report_cnt) {
			this.mreply_report_cnt = mreply_report_cnt;
		}

		public int getMember_no() {
			return member_no;
		}

		public void setMember_no(int member_no) {
			this.member_no = member_no;
		}

		public String getMreply_reg_date() {
			return mreply_reg_date;
		}

		public void setMreply_reg_date(String mreply_reg_date) {
			this.mreply_reg_date = mreply_reg_date;
		}

		@Override
		public String toString() {
			return "ReplyVO [mboard_rno=" + mboard_rno + ", moviecd=" + moviecd + ", mboard_no=" + mboard_no
					+ ", member_id=" + member_id + ", mreply_content=" + mreply_content + ", mreply_like_cnt="
					+ mreply_like_cnt + ", mreply_dislike_cnt=" + mreply_dislike_cnt + ", mreply_report_cnt="
					+ mreply_report_cnt + ", member_no=" + member_no + ", mreply_reg_date=" + mreply_reg_date
					+ ", getMboard_rno()=" + getMboard_rno() + ", getMoviecd()=" + getMoviecd() + ", getMboard_no()="
					+ getMboard_no() + ", getMember_id()=" + getMember_id() + ", getMreply_content()="
					+ getMreply_content() + ", getMreply_like_cnt()=" + getMreply_like_cnt()
					+ ", getMreply_dislike_cnt()=" + getMreply_dislike_cnt() + ", getMreply_report_cnt()="
					+ getMreply_report_cnt() + ", getMember_no()=" + getMember_no() + ", getMreply_reg_date()="
					+ getMreply_reg_date() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
					+ ", toString()=" + super.toString() + "]";
		}

		public ReplyVO(int mboard_rno, int moviecd, int mboard_no, String member_id, String mreply_content,
				int mreply_like_cnt, int mreply_dislike_cnt, int mreply_report_cnt, int member_no,
				String mreply_reg_date) {
			super();
			this.mboard_rno = mboard_rno;
			this.moviecd = moviecd;
			this.mboard_no = mboard_no;
			this.member_id = member_id;
			this.mreply_content = mreply_content;
			this.mreply_like_cnt = mreply_like_cnt;
			this.mreply_dislike_cnt = mreply_dislike_cnt;
			this.mreply_report_cnt = mreply_report_cnt;
			this.member_no = member_no;
			this.mreply_reg_date = mreply_reg_date;
		}
		
		
}       
