package com.five.ware;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/notice/*")
public class NoticeController {

	@RequestMapping(value="notice")
	public String notice(){
		return "notice/notice";
	}
	
	@RequestMapping(value="noticeView")
	public String noticeView(){
		return "notice/noticeView";
	}
	
	@RequestMapping(value="noticeWrite")
	public String noticeWrite(){
		return "notice/noticeWrite";
	}
	
}
