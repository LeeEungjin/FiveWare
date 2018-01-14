package com.five.ware.eung.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.five.ware.calendar.GoogleCalendarService;


@Controller
@RequestMapping(value="calendar/**")
public class CalendarAjaxController {
private Logger logger = LoggerFactory.getLogger(CalendarAjaxController.class);
    
    // 일정 데이터 처리
	@ResponseBody
    @RequestMapping(value="calendarEventList", method=RequestMethod.POST)
    public List<Event> calendarEventList(CalendarEventDTO calDto) {
        logger.info("calendarEventList "+calDto.toString());
        System.out.println("CalendarId = "+calDto.getCalendarId());
        
        List<Event> items = new ArrayList<Event>();
        try {
            com.google.api.services.calendar.Calendar service = GoogleCalendarService.getCalendarService();
            Events events = service.events().list(calDto.getCalendarId()).setOrderBy("startTime").setSingleEvents(true).execute();
            items = events.getItems();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        System.out.println("calendarEventList - size(): "+ items.size());
        
        return items;
    }
    
    // 일정 저장 처리
    @RequestMapping(value="calendarEventAdd", method=RequestMethod.POST)
    public Map<String, Boolean> calendarEventAdd(CalendarEventDTO calDto) {
        logger.info("calendarEventAdd "+calDto.toString());
        
        boolean isc = false;
        try {
            Calendar service = GoogleCalendarService.getCalendarService();
            Event event = new Event().setSummary(calDto.getSummary()).setDescription(calDto.getDescription());
            //시작일
            DateTime startDateTime = new DateTime(calDto.getStartDateTime());
            EventDateTime start = new EventDateTime().setDateTime(startDateTime).setTimeZone("America/Los_Angeles");
            event.setStart(start);
            //종료일
            DateTime endDateTime = new DateTime(calDto.getEndDateTime());
            EventDateTime end = new EventDateTime().setDateTime(endDateTime).setTimeZone("America/Los_Angeles");
            event.setEnd(end);
            event = service.events().insert(calDto.getCalendarId(), event).execute();
            isc = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        Map<String, Boolean> map = new HashMap<String, Boolean>();
        map.put("isc", isc);
        return map;
    }
    
    // 일정 삭제
    @RequestMapping(value="calendarEventRemoveOne", method=RequestMethod.POST)
    public Map<String, Boolean> calendarEventRemoveOne(CalendarEventDTO calDto) {
        logger.info("calendarEventRemoveOne "+calDto.toString());
        
        boolean isc = false;
        try {
            Calendar service = GoogleCalendarService.getCalendarService();
            service.events().delete(calDto.getCalendarId(), calDto.getEventId()).execute();
            isc = true;
        } catch (IOException e) {
            e.printStackTrace();
        }
        Map<String, Boolean> map = new HashMap<String, Boolean>();
        map.put("isc", isc);
        return map;
    }
    
    // 일정 수정
    @RequestMapping(value="calendarEventModify", method=RequestMethod.POST)
    public Map<String, Boolean> calendarEventModify(CalendarEventDTO calDto) {
        logger.info("calendarEventModify "+calDto.toString());
        
        boolean isc = false;
        try {
            Calendar service = GoogleCalendarService.getCalendarService();
            Event event = service.events().get(calDto.getCalendarId(), calDto.getEventId()).execute();
            event.setSummary(calDto.getSummary()).setDescription(calDto.getDescription());
            service.events().update(calDto.getCalendarId(), event.getId(), event).execute();
            isc = true;
        } catch (IOException e) {
            e.printStackTrace();
        }
        Map<String, Boolean> map = new HashMap<String, Boolean>();
        map.put("isc", isc);
        return map;
    }


}
