package com.five.ware.mater;

import java.util.List;

import com.five.ware.order.OrderProductDTO;


public class MaterOrderDTO{
	private String orderCode;
	private String contractDate;
	private String temp;
	private String name;
	private String account;
	private String division;
	private String delivery;
	private String condition;
	private String deadline;
	private String storageName;
	private String orderMemo;

	private OrderProductDTO orderProductDTO;
	
	

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getContractDate() {
		return contractDate;
	}

	public void setContractDate(String contractDate) {
		this.contractDate = contractDate;
	}

	public String getTemp() {
		return temp;
	}

	public void setTemp(String temp) {
		this.temp = temp;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getStorageName() {
		return storageName;
	}

	public void setStorageName(String storageName) {
		this.storageName = storageName;
	}

	public String getOrderMemo() {
		return orderMemo;
	}

	public void setOrderMemo(String orderMemo) {
		this.orderMemo = orderMemo;
	}

	public OrderProductDTO getOrderProductDTO() {
		return orderProductDTO;
	}

	public void setOrderProductDTO(OrderProductDTO orderProductDTO) {
		this.orderProductDTO = orderProductDTO;
	}
	
	
}
