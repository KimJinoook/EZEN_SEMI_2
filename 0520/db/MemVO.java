package com.semi2.db;

public class MemVO {
	private int mem_no;
	private String mem_name;
	private String mem_id;
	private String mem_pw;
	private String mem_birth;
	private String mem_tel;
	private String mem_zipcode;
	private String mem_add;
	private String mem_add2;
	private String mem_pic;
	private String mem_manager;
	
	public MemVO() {
		super();
	}	

	public MemVO(int mem_no, String mem_name, String mem_id, String mem_pw, String mem_birth, String mem_tel,
			String mem_zipcode, String mem_add, String mem_add2, String mem_pic) {
		super();
		this.mem_no = mem_no;
		this.mem_name = mem_name;
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_birth = mem_birth;
		this.mem_tel = mem_tel;
		this.mem_zipcode = mem_zipcode;
		this.mem_add = mem_add;
		this.mem_add2 = mem_add2;
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

	public String getMem_tel() {
		return mem_tel;
	}

	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
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

	public String getMem_zipcode() {
		return mem_zipcode;
	}

	public void setMem_zipcode(String mem_zipcode) {
		this.mem_zipcode = mem_zipcode;
	}

	public String getMem_add2() {
		return mem_add2;
	}

	public void setMem_add2(String mem_add2) {
		this.mem_add2 = mem_add2;
	}

	
	
	public String getMem_manager() {
		return mem_manager;
	}

	public void setMem_manager(String mem_manager) {
		this.mem_manager = mem_manager;
	}

	@Override
	public String toString() {
		return "MemVO [mem_no=" + mem_no + ", mem_name=" + mem_name + ", mem_id=" + mem_id + ", mem_pw=" + mem_pw
				+ ", mem_birth=" + mem_birth + ", mem_tel=" + mem_tel + ", mem_zipcode=" + mem_zipcode + ", mem_add="
				+ mem_add + ", mem_add2=" + mem_add2 + ", mem_pic=" + mem_pic + "]";
	}	
	
}
