package com.five.ware;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.notice.ListData;
import com.five.ware.erp.notice.NoticeService;

@Controller
@RequestMapping(value="/notice/*")
public class NoticeController {
	
	@Inject
	private NoticeService noticeService;

	//selectList
	@RequestMapping(value="noticeList")
	public ModelAndView selectList(ListData listData, ModelAndView mv) throws Exception{
		mv = noticeService.selectList(listData);
		return mv;
	}
	
	@RequestMapping(value="noticeView")
	public String noticeView(){
		return "notice/noticeView";
	}
	
	@RequestMapping(value="noticeWrite")
	public String noticeWrite(){
		return "notice/noticeWrite";
	}
	
	@RequestMapping(value="noticeUpdate")
	public String noticeUpdate(){
		return "notice/noticeUpdate";
	}
	
	@RequestMapping(value="meetingRoom")
	public String meetingRoom(){
		return "notice/meetingRoom";
	}
}
