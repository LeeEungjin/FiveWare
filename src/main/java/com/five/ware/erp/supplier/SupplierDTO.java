package com.five.ware.erp.supplier;

public class SupplierDTO {
	private String code;			// 거래처 코드
	private String classification;	// 거래처 분류
	private String name;			// 거래처명
	private String business_number;	// 사업자번호
	private String representative; 	// 대표자
	private String division;		// 당담자
	private String division_mail;	// 당담자 메일
	private String bank;			// 은행명
	private String account_number;	// 계좌번호
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
