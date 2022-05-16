package com.semi2.db;

import java.sql.Timestamp;

public class StoreVO {
	private int no;
	private String name;
	private String add;
	private String tel;
	private String kind;
	private String price;
	private String parking;
	private String time;
	private String restDay;
	private String preview;
	private Timestamp regdate;
	private String pic;
	private int like;
	private String locationlati;
	private String locationlongi;

	public StoreVO(int no, String name, String add, String tel, String kind, String price, String parking, String time,
			String restDay, String preview, Timestamp regdate, String pic, int like, String locationlati, String locationlongi) {
		super();
		this.no = no;
		this.name = name;
		this.add = add;
		this.tel = tel;
		this.kind = kind;
		this.price = price;
		this.parking = parking;
		this.time = time;
		this.restDay = restDay;
		this.preview = preview;
		this.regdate = regdate;
		this.pic = pic;
		this.like = like;
		this.locationlati = locationlati;
		this.locationlongi = locationlongi;
	}

	public StoreVO() {
		super();
	}

	public StoreVO(int no, String name, String add, String tel, String kind, String price, String parking, String time,
			String restDay, String preview, Timestamp regdate, String pic, int like) {
		super();
		this.no = no;
		this.name = name;
		this.add = add;
		this.tel = tel;
		this.kind = kind;
		this.price = price;
		this.parking = parking;
		this.time = time;
		this.restDay = restDay;
		this.preview = preview;
		this.regdate = regdate;
		this.pic = pic;
		this.like = like;
	}
	
	

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAdd() {
		return add;
	}

	public void setAdd(String add) {
		this.add = add;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getRestDay() {
		return restDay;
	}

	public void setRestDay(String restDay) {
		this.restDay = restDay;
	}

	public String getPreview() {
		return preview;
	}

	public void setPreview(String preview) {
		this.preview = preview;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}
	
	
	public String getLocationlati() {
		return locationlati;
	}

	public void setLocationlati(String locationlati) {
		this.locationlati = locationlati;
	}

	public String getLocationlongi() {
		return locationlongi;
	}

	public void setLocationlongi(String locationlongi) {
		this.locationlongi = locationlongi;
	}

	@Override
	public String toString() {
		return "StoreVO [no=" + no + ", name=" + name + ", add=" + add + ", tel=" + tel + ", kind=" + kind + ", price="
				+ price + ", parking=" + parking + ", time=" + time + ", restDay=" + restDay + ", preview=" + preview
				+ ", regdate=" + regdate + ", pic=" + pic + ", like=" + like + ", location=" + locationlati+", "+locationlongi + "]";
	}
	
}