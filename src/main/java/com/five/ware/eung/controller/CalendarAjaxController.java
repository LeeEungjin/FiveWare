package com.five.ware.eung.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.api.client.util.DateTime;
import com.google.api.services.calendar.Calendar;
import com.google.api.services.calendar.model.Event;
import com.google.api.services.calendar.model.EventDateTime;
import com.google.api.services.calendar.model.Events;
import com.five.ware.calendar.CalendarEventDTO;
import com.five.ware.calendar.CalendarEventService;
import com.five.ware.calendar.GoogleCalendarService;

@Controller
@RequestMapping(value="calendar/**")
public class CalendarAjaxController {
	private Logger logger = LoggerFactory.getLogger(CalendarAjaxController.class);
    
	@Inject
	private CalendarEventService calendarEventService;
	
    //calendarEventList
	@ResponseBody
    @RequestMapping(value="calendarEventList", method=RequestMethod.POST)
    public List<CalendarEventDTO> calendarEventList(CalendarEventDTO calendarEventDTO) {
        logger.info("calendarEventList "+calendarEventDTO.toString());
        System.out.println("CalendarId = "+calendarEventDTO.getCalendarId());
        
        /*List<Event> items = new ArrayList<Event>();
        try {
            com.google.api.services.calendar.Calendar service = GoogleCalendarService.getCalendarService();
            Events events = service.events().list(calDto.getCalendarId()).setOrderBy("startTime").setSingleEvents(true).execute();
            items = events.getItems();
        } catch (IOException e) {
            e.printStackTrace();
        }*/
        
        List<CalendarEventDTO> items = new ArrayList<CalendarEventDTO>();
        
        try {
			items = calendarEventService.selectList();
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        return items;
    }
    
    //calendarEventAdd
    @RequestMapping(value="calendarEventAdd", method=RequestMethod.POST)
    public Map<String, Boolean> calendarEventAdd(CalendarEventDTO calendarEventDTO) {
        logger.info("calendarEventAdd "+calendarEventDTO.toString());
        
        System.out.println(calendarEventDTO.getStartDate());
        System.out.println(calendarEventDTO.getStartTime());
        
        /*boolean isc = false;
        try {
            Calendar service = GoogleCalendarService.getCalendarService();
            Event event = new Event().setSummary(calendarEventDTO.getSummary()).setDescription(calendarEventDTO.getDescription());
            //startDate
            DateTime startDateTime = new DateTime(calendarEventDTO.getStartDateTime());
            EventDateTime start = new EventDateTime().setDateTime(startDateTime).setTimeZone("America/Los_Angeles");
            event.setStart(start);
            //endDate
            DateTime endDateTime = new DateTime(calendarEventDTO.getEndDateTime());
            EventDateTime end = new EventDateTime().setDateTime(endDateTime).setTimeZone("America/Los_Angeles");
            event.setEnd(end);
            event = service.events().insert(calendarEventDTO.getCalendarId(), event).execute();
            isc = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        Map<String, Boolean> map = new HashMap<String, Boolean>();
        map.put("isc", isc);*/
        
        boolean isc = false;
        try {
        	int result = calendarEventService.insert(calendarEventDTO);
        	if(result > 0) {
        		isc = true;
        	}
        } catch (Exception e) {
        	e.printStackTrace();
        }
        
        Map<String, Boolean> map = new HashMap<String, Boolean>();
        map.put("isc", isc);
        
        return map;
    }
    
    // �씪�젙 �궘�젣
    @RequestMapping(value="calendarEventRemoveOne", method=RequestMethod.POST)
    public Map<String, Boolean> calendarEventRemoveOne(CalendarEventDTO calendarEventDTO) {
        logger.info("calendarEventRemoveOne "+calendarEventDTO.toString());
        
        /*boolean isc = false;
        try {
            Calendar service = GoogleCalendarService.getCalendarService();
            service.events().delete(calendarEventDTO.getCalendarId(), calendarEventDTO.getEventId()).execute();
            isc = true;
        } catch (IOException e) {
            e.printStackTrace();
        }
        Map<String, Boolean> map = new HashMap<String, Boolean>();
        map.put("isc", isc);*/
        
        boolean isc = false;
        try {
			int result = calendarEventService.delete(calendarEventDTO);
			if(result > 0) {
				isc = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        Map<String, Boolean> map = new HashMap<String, Boolean>();
        map.put("isc", isc);
        
        return map;
    }
    
    // �씪�젙 �닔�젙
    @RequestMapping(value="calendarEventModify", method=RequestMethod.POST)
    public Map<String, Boolean> calendarEventModify(CalendarEventDTO calendarEventDTO) {
        logger.info("calendarEventModify "+calendarEventDTO.toString());
        
       /*boolean isc = false;
        try {
            Calendar service = GoogleCalendarService.getCalendarService();
            Event event = service.events().get(calendarEventDTO.getCalendarId(), calendarEventDTO.getEventId()).execute();
            event.setSummary(calendarEventDTO.getSummary()).setDescription(calendarEventDTO.getDescription());
            service.events().update(calendarEventDTO.getCalendarId(), event.getId(), event).execute();
            isc = true;
        } catch (IOException e) {
            e.printStackTrace();
        }
        Map<String, Boolean> map = new HashMap<String, Boolean>();
        map.put("isc", isc);*/
        
        boolean isc = false;
        try {
        	int result = calendarEventService.update(calendarEventDTO);
        	
        	if(result > 0) {
        		isc = true;
        	}
        } catch (Exception e) {
        	e.printStackTrace();
        }
        
        Map<String, Boolean> map = new HashMap<String, Boolean>();
        map.put("isc", isc);
        
        return map;
    }


}
