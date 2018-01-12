package com.five.ware.community;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;


public class CommunityFileDTO{
	
	private MultipartFile [] files;
	private List<UploadDTO> fileNames;
	
	public MultipartFile[] getFiles() {
		return files;
	}
	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}
	public List<UploadDTO> getFileNames() {
		return fileNames;
	}
	public void setFileNames(List<UploadDTO> fileNames) {
		this.fileNames = fileNames;
	}
	
	
}
