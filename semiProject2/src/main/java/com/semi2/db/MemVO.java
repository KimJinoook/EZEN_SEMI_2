package com.semi2.db;

public class MemVO {
	private int mem_no;
	private String mem_name;
	private String mem_id;
	private String mem_pw;
	private String mem_birth;
	private String mem_te;
	private String mem_add;
	private String mem_pic;
	
	public MemVO() {
		super();
	}

	public MemVO(int mem_no, String mem_name, String mem_id, String mem_pw, String mem_birth, String mem_te,
			String mem_add, String mem_pic) {
		super();
		this.mem_no = mem_no;
		this.mem_name = mem_name;
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_birth = mem_birth;
		this.mem_te = mem_te;
		this.mem_add = mem_add;
		this.mem_pic = mem_pic;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_birth() {
		return mem_birth;
	}

	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}

	public String getMem_te() {
		return mem_te;
	}

	public void setMem_te(String mem_te) {
		this.mem_te = mem_te;
	}

	public String getMem_add() {
		return mem_add;
	}

	public void setMem_add(String mem_add) {
		this.mem_add = mem_add;
	}

	public String getMem_pic() {
		return mem_pic;
	}

	public void setMem_pic(String mem_pic) {
		this.mem_pic = mem_pic;
	}
	
	
	
	
}
