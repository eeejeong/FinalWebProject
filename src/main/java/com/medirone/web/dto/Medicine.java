package com.medirone.web.dto;

public class Medicine {
	int med_id;
	String med_name;
	int med_weight;
	String med_usage;
	int med_amount;
	String member_hospital_id;
	
	public int getMed_id() {
		return med_id;
	}
	public void setMed_id(int med_id) {
		this.med_id = med_id;
	}
	public String getMed_name() {
		return med_name;
	}
	public void setMed_name(String med_name) {
		this.med_name = med_name;
	}
	public int getMed_weight() {
		return med_weight;
	}
	public void setMed_weight(int med_weight) {
		this.med_weight = med_weight;
	}
	public String getMed_usage() {
		return med_usage;
	}
	public void setMed_usage(String med_usage) {
		this.med_usage = med_usage;
	}
	public int getMed_amount() {
		return med_amount;
	}
	public void setMed_amount(int med_amount) {
		this.med_amount = med_amount;
	}
	public String getMember_hospital_id() {
		return member_hospital_id;
	}
	public void setMember_hospital_id(String member_hospital_id) {
		this.member_hospital_id = member_hospital_id;
	}

}
