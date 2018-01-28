package com.five.ware.project;

public class ProjectDTO {

	private int prj_no;
	private String prj_name;
	private String prj_start;
	private String prj_last;
	private String prj_delflag;
	
	public ProjectDTO() {}

	public int getPrj_no() {
		return prj_no;
	}
	public void setPrj_no(int prj_no) {
		this.prj_no = prj_no;
	}
	public String getPrj_name() {
		return prj_name;
	}
	public void setPrj_name(String prj_name) {
		this.prj_name = prj_name;
	}
	public String getPrj_start() {
		return prj_start.split(" ")[0];
	}
	public void setPrj_start(String prj_start) {
		this.prj_start = prj_start;
	}
	public String getPrj_last() {
		return prj_last.split(" ")[0];
	}
	public void setPrj_last(String prj_last) {
		this.prj_last = prj_last;
	}
	public String getPrj_delflag() {
		return prj_delflag;
	}
	public void setPrj_delflag(String prj_delflag) {
		this.prj_delflag = prj_delflag;
	}
	
	@Override
	public String toString() {
		return "ProjectDto [prj_no=" + prj_no +", prj_name=" + prj_name + ", prj_start="
				+ prj_start + ", prj_last=" + prj_last + ", prj_delflag=" + prj_delflag + "]";
	}
}
