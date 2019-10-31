package com.medirone.web.dto;

public class RequestItems {
	private int order_id;
	private String item_class;
	private int item_id;
	private int item_amount;
	private SupplyItems supplyitems;
	
	public SupplyItems getSupplyitems() {
		return supplyitems;
	}
	public void setSupplyitems(SupplyItems supplyitems) {
		this.supplyitems = supplyitems;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getItem_class() {
		return item_class;
	}
	public void setItem_class(String item_class) {
		this.item_class = item_class;
	}
	public int getItem_id() {
		return item_id;
	}
	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}
	public int getItem_amount() {
		return item_amount;
	}
	public void setItem_amount(int item_amount) {
		this.item_amount = item_amount;
	}
}
