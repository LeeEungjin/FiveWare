package com.five.ware.jh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.event.EventService;
import com.five.ware.util.ListData;

@Controller
@RequestMapping(value="/event/**")
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	@RequestMapping(value="eventRegist")
	public String eventRegist()throws Exception{
		
		return "erp/event/eventRegist";
	}
	
	@RequestMapping(value="eventList")
	public ModelAndView eventList(ListData listData)throws Exception{
		ModelAndView mv=null;
		
		mv=eventService.selectList(listData);
		
		return mv;
	}
	
}
