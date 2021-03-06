package com.five.ware.jh.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.event.EventDTO;
import com.five.ware.event.EventService;
import com.five.ware.util.ListData;

@Controller
@RequestMapping(value="**/event/**")
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	@RequestMapping(value="eventDateList")
	public ModelAndView materDateSerach(ModelAndView mv, ListData listData, String sdate, String edate){

		try {
			mv.addObject("dateList", eventService.eventDateList(listData, sdate, edate));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName("erp/event/eventDateList");
		
		return mv;
	}
	
	@RequestMapping(value="eventUpdate")
	public String update(EventDTO eventDTO, RedirectAttributes rd, HttpSession session)throws Exception{
		int result=0;
		String message="이벤트 수정을 실패하였습니다.";
		
		result=eventService.update(eventDTO, session);
		
		if(result>0){
			message="이벤트 수정을 성공하였습니다.";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./eventRegist";
	}
	
	
	@RequestMapping(value="eventInsert")
	public String insert(EventDTO eventDTO, RedirectAttributes rd, HttpSession session)throws Exception{
		int result=0;
		String message="이벤트 등록을 실패하였습니다.";
		
		result=eventService.insert(eventDTO, session);
		
		if(result>0){
			message="이벤트 등록을 성공하였습니다.";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./eventRegist";
	}
	
	@RequestMapping(value="eventRegist")
	public ModelAndView eventRegist(ListData listData)throws Exception{
		ModelAndView mv=null;
		
		mv=eventService.eventList(listData);
		
		return mv;
	}
	
	@RequestMapping(value="eventList")
	public ModelAndView eventList(int perPage, int curPage, ListData listData,HttpSession session)throws Exception{
		ModelAndView mv=null;
		
		System.out.println(session.getServletContext().getRealPath("resources/upload"));
		
		mv=eventService.selectList(perPage, curPage, listData);
		
		return mv;
	}
	
	@RequestMapping(value="eventView")
	@ResponseBody
	public Map<String, Object> selectOne(int eventNum)throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		
		map=eventService.selectOne(eventNum);
		
		return map;
	}
	
	@RequestMapping(value="eventDelete")
	public String delete(int eventNum, RedirectAttributes rd)throws Exception{
		int result=0;
		String message="이벤트 삭제를 실패하였습니다.";
		
		result=eventService.delete(eventNum);
		
		if(result>0){
			message="이벤트 삭제를 성공하였습니다.";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./eventRegist";
	}
	
	@RequestMapping(value="eventRecord")
	@ResponseBody
	public ModelAndView eventListS() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		Calendar ca = Calendar.getInstance();
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = sd.format(ca.getTime());
		
		mv=eventService.eventListS();
		
		mv.addObject("sysdate", sysdate);
		mv.setViewName("srm/event/eventRecord");
		
		return mv;
		
	}
}
