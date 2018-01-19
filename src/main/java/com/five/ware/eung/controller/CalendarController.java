package com.five.ware.eung.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.five.ware.calendar.CalendarDTO;
import com.five.ware.calendar.CalendarService;
import com.five.ware.meeting.MeetingDTO;
import com.five.ware.meeting.MeetingService;


@Controller
@RequestMapping(value="calendar/**")
public class CalendarController {
	
	@Inject
	private CalendarService calendarService;
	@Inject
	private MeetingService meetingService;
	
	private Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	/*@RequestMapping(value="/meetingAdd", method=RequestMethod.POST)
    public String meetingAdd(MeetingDTO meetingDTO) {
        logger.info("meetingAdd "+meetingDTO.toString());
        
        int result = 0;
        try {
			result = meetingService.insert(meetingDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        if(result > 0) { }
        
        return "redirect:./coding";
    }*/
	
	/********************************************************************************/

	// 
    @RequestMapping(value="/coding", method=RequestMethod.GET)
    public void coding(Model model) {
        logger.info("calendarList");
        
        try {
			List<CalendarDTO> itmes = calendarService.selectList();
			List<MeetingDTO> meeting = meetingService.selectList();
			
			model.addAttribute("items", itmes);
			model.addAttribute("meeting", meeting);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
    }
    
    // calendarAdd
    @RequestMapping(value="/calendarAdd", method=RequestMethod.POST)
    public String calendarAdd(CalendarDTO calendarDTO) {
        logger.info("calendarAdd "+calendarDTO.toString());
        
        int result = 0;
        try {
			result = calendarService.insert(calendarDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        if(result > 0) { }
        
        return "redirect:./coding";
    }
    
    // calendarRemove
    @RequestMapping(value="/calendarRemove", method=RequestMethod.POST)
    public String calendarRemove(HttpServletRequest req) {
        logger.info("calendarRemove");
        
        String[] chkVal = req.getParameterValues("chkVal");
        int result = 0;
		try {
			for (String calendarId : chkVal) {
				result = calendarService.delete(calendarId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result > 0) {}
        
        return "redirect:./coding";
    }    
    
    // calendarModify
    @RequestMapping(value="/calendarModify", method=RequestMethod.POST)
    public String calendarModify(CalendarDTO calendarDTO) {
        logger.info("calendarModify "+calendarDTO.toString());
        
        int result = 0;
        try {
			result = calendarService.update(calendarDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        if(result > 0) {}
        
        return "redirect:./coding";
    }    
    
    // schdule go
    @RequestMapping(value="/schdule", method=RequestMethod.GET)
    public String schdule(Model model, String calendarId, String title) {
        logger.info("schdule");
        model.addAttribute("calendarId", calendarId);
        model.addAttribute("title", title);
        return "calendar/schdule";
    }    

}
