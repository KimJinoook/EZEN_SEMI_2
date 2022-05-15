package com.semi2.db;

public class ListGroupVO {
	private int group_no;
	private String group_name;
	public ListGroupVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ListGroupVO(int group_no, String group_name) {
		super();
		this.group_no = group_no;
		this.group_name = group_name;
	}
	public int getGroup_no() {
		return group_no;
	}
	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	
	
}
