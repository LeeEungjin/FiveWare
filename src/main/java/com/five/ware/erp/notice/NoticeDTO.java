package com.five.ware.erp.notice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class NoticeDTO extends NoticeFileDTO{

	private int num;
	private String part;
	private String writer;
	private String title;
	private String contents;
	private String reg_date;
	private int hit;
	private NoticeFileDTO noticeFileDTO;
		
	public NoticeFileDTO getNoticeFileDTO() {
		return noticeFileDTO;
	}
	public void setNoticeFileDTO(NoticeFileDTO noticeFileDTO) {
		this.noticeFileDTO = noticeFileDTO;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
}
