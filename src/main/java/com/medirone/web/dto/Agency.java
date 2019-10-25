package com.medirone.web.dto;

public class Agency {
	private String agency_id;
	private String agency_password;
	private String agency_name;
	private String agency_tel;
	private String agency_address;
	private double agency_latitude;
	private double agency_longitude;	
	
	public String getAgency_id() {
		return agency_id;
	}
	public void setAgency_id(String agency_id) {
		this.agency_id = agency_id;
	}
	public String getAgency_password() {
		return agency_password;
	}
	public void setAgency_password(String agency_password) {
		this.agency_password = agency_password;
	}
	public String getAgency_name() {
		return agency_name;
	}
	public void setAgency_name(String agency_name) {
		this.agency_name = agency_name;
	}
	public String getAgency_tel() {
		return agency_tel;
	}
	public void setAgency_tel(String agency_tel) {
		this.agency_tel = agency_tel;
	}
	public String getAgency_address() {
		return agency_address;
	}
	public void setAgency_address(String agency_address) {
		this.agency_address = agency_address;
	}
	public double getAgency_latitude() {
		return agency_latitude;
	}
	public void setAgency_latitude(double agency_latitude) {
		this.agency_latitude = agency_latitude;
	}
	public double getAgency_longitude() {
		return agency_longitude;
	}
	public void setAgency_longitude(double agency_longitude) {
		this.agency_longitude = agency_longitude;
	}	
}
