package com.medirone.web.dto;

import java.util.Date;

import com.medirone.web.service.OrderStatus;


public class Request {
	private int order_id;
	private String order_agency_id;
	private Date order_date;
	private String order_need_time;
	private OrderStatus order_status;
	private Date delivered_date;
	private String delivered_check;
	private Agency agency;
	
	public String getDelivered_check() {
		return delivered_check;
	}
	public void setDelivered_check(String delivered_check) {
		this.delivered_check = delivered_check;
	}
	public Agency getAgency() {
		return agency;
	}
	public void setAgency(Agency agency) {
		this.agency = agency;
	}
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
	public String getOrder_need_time() {
		return order_need_time;
	}
	public void setOrder_need_time(String order_need_time) {
		this.order_need_time = order_need_time;
	}
	public OrderStatus getOrder_status() {
		return order_status;
	}
	public void setOrder_status(OrderStatus order_status) {
		this.order_status = order_status;
	}
	public Date getDelivered_date() {
		return delivered_date;
	}
	public void setDelivered_date(Date delivered_date) {
		this.delivered_date = delivered_date;
	}
}
