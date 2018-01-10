package com.five.ware.erp.supplier;

import com.five.ware.erp.into.IntoDTO;

public class SupplierDTO{
	private String code;			// 嫄곕옒泥� 肄붾뱶
	private String classification;	// 嫄곕옒泥� 遺꾨쪟
	private String name;			// 嫄곕옒泥섎챸
	private String business_number;	// �궗�뾽�옄踰덊샇
	private String representative; 	// ���몴�옄
	private String division;		// �떦�떞�옄
	private String division_mail;	// �떦�떞�옄 硫붿씪
	private String bank;			// ���뻾紐�
	private String account_number;	// 怨꾩쥖踰덊샇
	private String use;

	public String getUse() {
		return use;
	}
	public void setUse(String use) {
		this.use = use;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBusiness_number() {
		return business_number;
	}
	public void setBusiness_number(String business_number) {
		this.business_number = business_number;
	}
	public String getRepresentative() {
		return representative;
	}
	public void setRepresentative(String representative) {
		this.representative = representative;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getDivision_mail() {
		return division_mail;
	}
	public void setDivision_mail(String division_mail) {
		this.division_mail = division_mail;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getAccount_number() {
		return account_number;
	}
	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}
	
}
