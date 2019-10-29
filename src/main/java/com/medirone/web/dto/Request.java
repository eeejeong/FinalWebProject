package com.medirone.web.dto;

import java.util.Date;

public class Request {
	private int order_id;
	private String order_agency_id;
	private Date order_date;
	private Date order_need_time;
	private String order_status;
	private Date delivered_date;
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getOrder_agency_id() {
		return order_agency_id;
	}
	public void setOrder_agency_id(String order_agency_id) {
		this.order_agency_id = order_agency_id;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public Date getOrder_need_time() {
		return order_need_time;
	}
	public void setOrder_need_time(Date order_need_time) {
		this.order_need_time = order_need_time;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public Date getDelivered_date() {
		return delivered_date;
	}
	public void setDelivered_date(Date delivered_date) {
		this.delivered_date = delivered_date;
	}
}
