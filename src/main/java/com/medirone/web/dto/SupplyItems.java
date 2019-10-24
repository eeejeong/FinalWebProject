package com.medirone.web.dto;

public class SupplyItems {
	private int sup_id;
	private String sup_name;
	private int sup_weight;
	private int sup_class;
	private int sup_amount;
	private String sup_hospital_id;
	public int getSup_id() {
		return sup_id;
	}
	public void setSup_id(int sup_id) {
		this.sup_id = sup_id;
	}
	public String getSup_name() {
		return sup_name;
	}
	public void setSup_name(String sup_name) {
		this.sup_name = sup_name;
	}
	public int getSup_weight() {
		return sup_weight;
	}
	public void setSup_weight(int sup_weight) {
		this.sup_weight = sup_weight;
	}
	public int getSup_class() {
		return sup_class;
	}
	public void setSup_class(int sup_class) {
		this.sup_class = sup_class;
	}
	public int getSup_amount() {
		return sup_amount;
	}
	public void setSup_amount(int sup_amount) {
		this.sup_amount = sup_amount;
	}
	public String getSup_hospital_id() {
		return sup_hospital_id;
	}
	public void setSup_hospital_id(String sup_hospital_id) {
		this.sup_hospital_id = sup_hospital_id;
	}
}
