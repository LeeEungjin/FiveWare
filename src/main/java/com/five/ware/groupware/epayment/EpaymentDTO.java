package com.five.ware.groupware.epayment;

public class EpaymentDTO {

	private int num;
	private String docunum;
	private String draftdate;
	private String draftcode;
	private String draftname;
	private String drafttemp;
	private String draftrank;
	private String kind;
	private String title;
	private String contents;
<<<<<<< HEAD
	private String result;
	private String approval;
	private String approvaltemp;
	private String memberCode;
	
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
=======
	private String state;
	
	
	public String getDraftrank() {
		return draftrank;
	}
	public void setDraftrank(String draftrank) {
		this.draftrank = draftrank;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
>>>>>>> arin
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getDocunum() {
		return docunum;
	}
	public void setDocunum(String docunum) {
		this.docunum = docunum;
	}
	public String getDraftdate() {
		return draftdate;
	}
	public void setDraftdate(String draftdate) {
		this.draftdate = draftdate;
	}
	public String getDraftcode() {
		return draftcode;
	}
	public void setDraftcode(String draftcode) {
		this.draftcode = draftcode;
	}
	public String getDraftname() {
		return draftname;
	}
	public void setDraftname(String draftname) {
		this.draftname = draftname;
	}
	public String getDrafttemp() {
		return drafttemp;
	}
	public void setDrafttemp(String drafttemp) {
		this.drafttemp = drafttemp;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	

}