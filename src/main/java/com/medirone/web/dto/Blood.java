package com.medirone.web.dto;

public class Blood {
	private int bl_id;
	private String bl_type;
	private int bl_weight;
	private int bl_amount;
	private int hospital_id;
	
	public int getBl_id() {
		return bl_id;
	}
	public void setBl_id(int bl_id) {
		this.bl_id = bl_id;
	}
	public String getBl_type() {
		return bl_type;
	}
	public void setBl_type(String bl_type) {
		this.bl_type = bl_type;
	}
	public int getBl_weight() {
		return bl_weight;
	}
	public void setBl_weight(int bl_weight) {
		this.bl_weight = bl_weight;
	}
	public int getBl_amount() {
		return bl_amount;
	}
	public void setBl_amount(int bl_amount) {
		this.bl_amount = bl_amount;
	}
	public int getHospital_id() {
		return hospital_id;
	}
	public void setHospital_id(int hospital_id) {
		this.hospital_id = hospital_id;
	}
	

}
