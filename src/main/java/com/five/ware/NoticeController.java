package com.five.ware;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.five.ware.erp.notice.NoticeDTO;
import com.five.ware.erp.notice.NoticeFileDTO;
import com.five.ware.erp.notice.NoticeService;
import com.five.ware.util.ListData;

@Controller
@RequestMapping(value="/notice/*")
public class NoticeController {
	
	@Inject
	private NoticeService noticeService;

	//selectList
	@RequestMapping(value="noticeList")
	public ModelAndView selectList(ListData listData, ModelAndView mv, String part) throws Exception{
		mv = noticeService.selectList(listData, part);
		
		return mv;
	}
	
	@RequestMapping(value="noticeView")
	public ModelAndView noticeView(ModelAndView mv, @RequestParam(defaultValue="0", required=false)int num) throws Exception{
		NoticeDTO noticeDTO = noticeService.selectOne(num);
		
		mv.addObject("view", noticeDTO);
		mv.setViewName("notice/noticeView");
		
		return mv;
	}
	
	@RequestMapping(value="noticeWrite", method = RequestMethod.GET)
	public String insert() throws Exception{
		
		return "notice/noticeWrite";
	}
	
	@RequestMapping(value="noticeWrite", method = RequestMethod.POST)
	public String insert(NoticeDTO noticeDTO, RedirectAttributes rd, HttpSession session) throws Exception	{
		int result = 0;
		
		result = noticeService.insert(noticeDTO, session);
		
		String message="FAIL";
		
		if(result>0)	{
			message = "SUCCESS";
		}
		rd.addFlashAttribute("message", message);
		
		return "redirect:noticeList";
	}
	
	@RequestMapping(value="noticeUpdate", method=RequestMethod.GET)
	public String update(int num, Model model) throws Exception{
		NoticeDTO noticeDTO = noticeService.selectOne(num);

		model.addAttribute("view", noticeDTO);
		
		return "notice/noticeUpdate";
	}
	
	@RequestMapping(value="noticeUpdate", method = RequestMethod.POST)
	public String update(NoticeDTO noticeDTO, RedirectAttributes rd, HttpSession session) throws Exception	{
		int result = 0;
		
		try {
			
			result = noticeService.update(noticeDTO, session);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		String message="FAIL";
		
		if(result>0)	{
			message = "SUCCESS";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:noticeList";
	}
	
	@RequestMapping(value="noticeDelete")
	public String delete(int num, RedirectAttributes rd) throws Exception	{
		int result = noticeService.delete(num);
		
		String message = "FAIL";
		
		if(result>0)	{
			message="SUCCESS";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:noticeList";
	}
	
	@RequestMapping(value="noticeFileDelete")
	@ResponseBody
	public String noticeFileDelete(int fnum) throws Exception	{
		int result = noticeService.fileDelete(fnum);
		
		String message="FAIL";
		
		if(result>0)	{
			message="SUCCESS";
		}
		
		return message;
	}
	
	
	@RequestMapping(value="meetingRoom")
	public String meetingRoom(){
		return "notice/meetingRoom";
	}
}
