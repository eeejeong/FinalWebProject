package com.medirone.web.dto;

import java.util.Date;

public class Agency {
	private String agency_id;
	private String agency_password;
	private String agency_name;
	private String agency_tel;
	private String agency_address;
	private double agency_latitude;
	private double agency_longitude;
	private String mission_waypoint;
	private String mission_writer;
	private String mission_write_date;

	
	public String getMission_waypoint() {
		return mission_waypoint;
	}
	public void setMission_waypoint(String mission_waypoint) {
		this.mission_waypoint = mission_waypoint;
	}
	public String getMission_writer() {
		return mission_writer;
	}
	public void setMission_writer(String mission_writer) {
		this.mission_writer = mission_writer;
	}
	public String getMission_write_date() {
		return mission_write_date;
	}
	public void setMission_write_date(String mission_write_date) {
		this.mission_write_date = mission_write_date;
	}
	private String agency_status;
	
	public String getAgency_status() {
		return agency_status;
	}
	public void setAgency_status(String agency_status) {
		this.agency_status = agency_status;
	}
	private Date agency_date;
	
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
	public Date getAgency_date() {
		return agency_date;
	}
	public void setAgency_date(Date agency_date) {
		this.agency_date = agency_date;
	}
	
	
}
