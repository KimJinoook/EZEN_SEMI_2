package com.semi2.db;

import java.sql.Timestamp;

public class CommentVO {
	 private int no;
	 private String id;    
	 private String pwd;
	 private Timestamp regdate;
	 private String content;
	 private int bdNo;
	 
	public CommentVO() {
		super();
	}

	public CommentVO(int no, String id, String pwd, Timestamp regdate, String content, int bdNo) {
		super();
		this.no = no;
		this.id = id;
		this.pwd = pwd;
		this.regdate = regdate;
		this.content = content;
		this.bdNo = bdNo;
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

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getBdNo() {
		return bdNo;
	}

	public void setBdNo(int bdNo) {
		this.bdNo = bdNo;
	}

	@Override
	public String toString() {
		return "CommentVO [no=" + no + ", id=" + id + ", pwd=" + pwd + ", regdate=" + regdate + ", content=" + content
				+ ", bdNo=" + bdNo + "]";
	}
	 
	
	 
	 
}
