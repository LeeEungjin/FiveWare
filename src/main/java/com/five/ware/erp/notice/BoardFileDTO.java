package com.five.ware.erp.notice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BoardFileDTO {

	private MultipartFile [] files;
	private List<NoticeFileDTO> fileNames;
	
	public MultipartFile[] getFiles() {
		return files;
	}
	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}
	public List<NoticeFileDTO> getFileNames() {
		return fileNames;
	}
	public void setFileNames(List<NoticeFileDTO> fileNames) {
		this.fileNames = fileNames;
	}
	
}
