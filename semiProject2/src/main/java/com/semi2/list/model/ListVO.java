package com.semi2.list.model;


public class ListVO {
	private int list_no;
	private String list_name;
	private String list_pic;
	private String list_comment;
	private int group_no;
	
	public ListVO() {
		super();
	}

	public ListVO(int list_no, String list_name, String list_pic, String list_comment, int group_no) {
		super();
		this.list_no = list_no;
		this.list_name = list_name;
		this.list_pic = list_pic;
		this.list_comment = list_comment;
		this.group_no = group_no;
	}
	
	

	public int getGroup_no() {
		return group_no;
	}

	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}

	public int getList_no() {
		return list_no;
	}

	public void setList_no(int list_no) {
		this.list_no = list_no;
	}

	public String getList_name() {
		return list_name;
	}

	public void setList_name(String list_name) {
		this.list_name = list_name;
	}

	public String getList_pic() {
		return list_pic;
	}

	public void setList_pic(String list_pic) {
		this.list_pic = list_pic;
	}

	public String getList_comment() {
		return list_comment;
	}

	public void setList_comment(String list_coment) {
		this.list_comment = list_coment;
	}

	
	
	
	
	
}
