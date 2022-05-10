package com.semi2.db;

import java.sql.Timestamp;

public class ReviewVO {
	private int reno;
	private int stno;
	private int memno;
	private String review;
	private float score;
	private Timestamp regdate;
	
	public ReviewVO() {
		super();
	}

	public ReviewVO(int reno, int stno, int memno, String review, float score, Timestamp regdate) {
		super();
		this.reno = reno;
		this.stno = stno;
		this.memno = memno;
		this.review = review;
		this.score = score;
		this.regdate = regdate;
	}

	public int getReno() {
		return reno;
	}

	public void setReno(int reno) {
		this.reno = reno;
	}

	public int getStno() {
		return stno;
	}

	public void setStno(int stno) {
		this.stno = stno;
	}

	public int getMemno() {
		return memno;
	}

	public void setMemno(int memno) {
		this.memno = memno;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
