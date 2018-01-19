package com.five.ware.event;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.util.ListData;

@Transactional
@Service
public class EventService {
	
	@Inject
	private EventDAO eventDAO;
	
	public ModelAndView selectList(ListData listData)throws Exception{
		
		listData.setCurPage(5);
		
		ModelAndView mv=new ModelAndView();
		List<EventDTO> eventList=eventDAO.selectList(listData.makeRow());;
		
		mv.addObject("eventList", eventList);
		mv.setViewName("srm/event/eventList");
		
		return mv;
	}

}
