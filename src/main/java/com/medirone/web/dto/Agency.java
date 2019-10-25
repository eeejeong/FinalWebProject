package com.medirone.web.dto;

import javax.xml.crypto.Data;

public class Agency {

	
	private String Agency_id;
	private String Agency_password;
	private String Agency_name;
	private int Agency_tel;
	private String Agency_address;
	private double Agency_latitude;
	private double Agency_longitude;
	
	private String Mission_waypoint;
	private String Mission_writer;
	private Data Mission_write_date;
	
	public String getAgency_id() {
		return Agency_id;
	}
	public void setAgency_id(String agency_id) {
		Agency_id = agency_id;
	}
	public String getAgency_password() {
		return Agency_password;
	}
	public void setAgency_password(String agency_password) {
		Agency_password = agency_password;
	}
	public String getAgency_name() {
		return Agency_name;
	}
	public void setAgency_name(String agency_name) {
		Agency_name = agency_name;
	}
	public int getAgency_tel() {
		return Agency_tel;
	}
	public void setAgency_tel(int agency_tel) {
		Agency_tel = agency_tel;
	}
	public String getAgency_address() {
		return Agency_address;
	}
	public void setAgency_address(String agency_address) {
		Agency_address = agency_address;
	}
	public double getAgency_latitude() {
		return Agency_latitude;
	}
	public void setAgency_latitude(float agency_latitude) {
		Agency_latitude = agency_latitude;
	}
	public double getAgency_longitude() {
		return Agency_longitude;
	}
	public void setAgency_longitude(float agency_longitude) {
		Agency_longitude = agency_longitude;
	}
	public String getMission_waypoint() {
		return Mission_waypoint;
	}
	public void setMission_waypoint(String mission_waypoint) {
		Mission_waypoint = mission_waypoint;
	}
	public String getMission_writer() {
		return Mission_writer;
	}
	public void setMission_writer(String mission_writer) {
		Mission_writer = mission_writer;
	}
	public Data getMission_write_date() {
		return Mission_write_date;
	}
	public void setMission_write_date(Data mission_write_date) {
		Mission_write_date = mission_write_date;
	}
	
	
	
	
}
