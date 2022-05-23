package com.semi2.board.model;

import java.sql.Timestamp;

public class BoardVO {
	 private int no;
	 private String id;    
	 private String pwd;
	 private String title;
	 private Timestamp  regdate;
	 private int readcount;
	 private String content;
	 private int btype;
	 
	//답변형 추가
	private int groupNo;
	private int step; 
	private int sortNo;
	private String delFlag;
	
	public BoardVO() {
		super();
	
	}

	public BoardVO(int no, String id, String pwd, String title, Timestamp regdate, int readcount, String content,
			int groupNo, int step, int sortNo, String delFlag) {
		super();
		this.no = no;
		this.id = id;
		this.pwd = pwd;
		this.title = title;
		this.regdate = regdate;
		this.readcount = readcount;
		this.content = content;
		this.groupNo = groupNo;
		this.step = step;
		this.sortNo = sortNo;
		this.delFlag = delFlag;
	}
	
	

	public int getBtype() {
		return btype;
	}

	public void setBtype(int btype) {
		this.btype = btype;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getSortNo() {
		return sortNo;
	}

	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", id=" + id + ", pwd=" + pwd + ", title=" + title + ", regdate=" + regdate
				+ ", readcount=" + readcount + ", content=" + content + ", groupNo=" + groupNo + ", step=" + step
				+ ", sortNo=" + sortNo + ", delFlag=" + delFlag + "]";
	}
	
	
	
}