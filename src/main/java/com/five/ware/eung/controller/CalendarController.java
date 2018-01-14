package com.five.ware.eung.controller;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.google.api.services.calendar.Calendar;
import com.google.api.services.calendar.model.CalendarList;
import com.google.api.services.calendar.model.CalendarListEntry;
import com.five.ware.calendar.CalendarEventDTO;
import com.five.ware.calendar.CalendarDTO;
import com.five.ware.calendar.CalendarService;
import com.five.ware.calendar.GoogleCalendarService;


@Controller
@RequestMapping(value="calendar/**")
public class CalendarController {
	
	@Inject
	private CalendarService calendarService;
	
	private Logger logger = LoggerFactory.getLogger(CalendarController.class);

	// 캘린더리스트
    @RequestMapping(value="/coding", method=RequestMethod.GET)
    public void coding(Model model) {
        logger.info("calendarList");
        /*try {
            Calendar service = GoogleCalendarService.getCalendarService();
            CalendarList calendarList = service.calendarList().list().setPageToken(null).execute();
            List<CalendarListEntry> items = calendarList.getItems();
            model.addAttribute("items", items);
        } catch (IOException e) {
            e.printStackTrace();
        }*/
        
        try {
			List<CalendarDTO> itmes = calendarService.selectList();
			model.addAttribute("items", itmes);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
    }
    
    // 캘린더 생성 처리
    @RequestMapping(value="/calendarAdd", method=RequestMethod.POST)
    public String calendarAdd(CalendarDTO calendarDTO) {
        logger.info("calendarAdd "+calendarDTO.toString());
        
        /*try {
            Calendar service = GoogleCalendarService.getCalendarService();
            com.google.api.services.calendar.model.Calendar calendar = new com.google.api.services.calendar.model.Calendar();
            calendar.setSummary(calDto.getSummary());
            calendar.setTimeZone("America/Los_Angeles");
            service.calendars().insert(calendar).execute();
        } catch (IOException e) {
            e.printStackTrace();
        }*/
        int result = 0;
        try {
			result = calendarService.insert(calendarDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        if(result > 0) { }
        
        return "redirect:./coding";
    }
    
    // 캘린더 삭제 처리
    @RequestMapping(value="/calendarRemove", method=RequestMethod.POST)
    public String calendarRemove(HttpServletRequest req) {
        logger.info("calendarRemove");
        
        /*String[] chkVal = req.getParameterValues("chkVal");
        try {
            Calendar service = GoogleCalendarService.getCalendarService();
            for (String calendarId : chkVal) {
                service.calendars().delete(calendarId).execute();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }*/
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
    
    // 캘린더 수정 처리
    @RequestMapping(value="/calendarModify", method=RequestMethod.POST)
    public String calendarModify(CalendarDTO calendarDTO) {
        logger.info("calendarModify "+calendarDTO.toString());
        
        /*try {
            Calendar service = GoogleCalendarService.getCalendarService();
            com.google.api.services.calendar.model.Calendar calendar = service.calendars().get(calDto.getCalendarId()).execute();
            calendar.setSummary(calDto.getSummary());
            service.calendars().update(calendar.getId(), calendar).execute();
        } catch (IOException e) {
            e.printStackTrace();
        }*/
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
    
    // 캘린더 이동처리
    @RequestMapping(value="/schdule", method=RequestMethod.GET)
    public String schdule(Model model, String calendarId, String title) {
        logger.info("schdule");
        model.addAttribute("calendarId", calendarId);
        model.addAttribute("title", title);
        return "calendar/schdule";
    }    

}
