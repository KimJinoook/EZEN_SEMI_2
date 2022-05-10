package com.semi2.db;

public class MenuVO {
	private int stno;
	private String menu_name;
	private String menu_price;
	private String menu_pic;
	
	public MenuVO() {
		super();

	}

	public MenuVO(int stno, String menu_name, String menu_price, String menu_pic) {
		super();
		this.stno = stno;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.menu_pic = menu_pic;
	}

	public int getStno() {
		return stno;
	}

	public void setStno(int stno) {
		this.stno = stno;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public String getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(String menu_price) {
		this.menu_price = menu_price;
	}

	public String getMenu_pic() {
		return menu_pic;
	}

	public void setMenu_pic(String menu_pic) {
		this.menu_pic = menu_pic;
	}
	
	
}
