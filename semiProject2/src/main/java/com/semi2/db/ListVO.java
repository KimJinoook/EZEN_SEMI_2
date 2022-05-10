package com.semi2.db;

public class ListVO {
	private int list_no;
	private String list_name;
	private String list_pic;
	private int zip_seq;
	
	public ListVO() {
		super();
	}

	public ListVO(int list_no, String list_name, String list_pic, int zip_seq) {
		super();
		this.list_no = list_no;
		this.list_name = list_name;
		this.list_pic = list_pic;
		this.zip_seq = zip_seq;
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

	public int getZip_seq() {
		return zip_seq;
	}

	public void setZip_seq(int zip_seq) {
		this.zip_seq = zip_seq;
	}
	
	
	
	
}
