package com.semi2.db;

public class ZipcodeVO {
	private String zip_code;
	private String zip_si;
	private String zip_gugun;
	private String zip_dong;
	private String zip_sbunji;
	private String zip_ebunji;
	private int zip_seq;
	
	public ZipcodeVO() {
		super();
	}

	public ZipcodeVO(String zip_code, String zip_si, String zip_gugun, String zip_dong, String zip_sbunji,
			String zip_ebunji, int zip_seq) {
		super();
		this.zip_code = zip_code;
		this.zip_si = zip_si;
		this.zip_gugun = zip_gugun;
		this.zip_dong = zip_dong;
		this.zip_sbunji = zip_sbunji;
		this.zip_ebunji = zip_ebunji;
		this.zip_seq = zip_seq;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public String getZip_si() {
		return zip_si;
	}

	public void setZip_si(String zip_si) {
		this.zip_si = zip_si;
	}

	public String getZip_gugun() {
		return zip_gugun;
	}

	public void setZip_gugun(String zip_gugun) {
		this.zip_gugun = zip_gugun;
	}

	public String getZip_dong() {
		return zip_dong;
	}

	public void setZip_dong(String zip_dong) {
		this.zip_dong = zip_dong;
	}

	public String getZip_sbunji() {
		return zip_sbunji;
	}

	public void setZip_sbunji(String zip_sbunji) {
		this.zip_sbunji = zip_sbunji;
	}

	public String getZip_ebunji() {
		return zip_ebunji;
	}

	public void setZip_ebunji(String zip_ebunji) {
		this.zip_ebunji = zip_ebunji;
	}

	public int getZip_seq() {
		return zip_seq;
	}

	public void setZip_seq(int zip_seq) {
		this.zip_seq = zip_seq;
	}
	
	
	
	
}
