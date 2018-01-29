package com.five.ware.cloud;

public class CloudDTO {
	
	private int num;
	private String code;
	private String folderpath;
	private String foldername;
	private String uppername;
	
	public String getUppername() {
		return uppername;
	}
	public void setUppername(String uppername) {
		this.uppername = uppername;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getFolderpath() {
		return folderpath;
	}
	public void setFolderpath(String folderpath) {
		this.folderpath = folderpath;
	}
	public String getFoldername() {
		return foldername;
	}
	public void setFoldername(String foldername) {
		this.foldername = foldername;
	}
}
