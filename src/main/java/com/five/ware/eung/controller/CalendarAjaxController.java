package com.five.ware.eung.controller;


import java.io.IOException;  

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.five.ware.calendar.CalendarEventDTO;
import com.five.ware.calendar.CalendarEventService;
import com.five.ware.meeting.MeetingRoomDTO;
import com.five.ware.meeting.MeetingRoomService;

@RestController
@RequestMapping(value="calendar/**")
public class CalendarAjaxController {
	private Logger logger = LoggerFactory.getLogger(CalendarAjaxController.class);
    
	@Inject
	private CalendarEventService calendarEventService;
	
	@Inject
	private MeetingRoomService meetingRoomService;
	
	
	
	@RequestMapping(value="meetingSearch", method=RequestMethod.POST)
	public List<MeetingRoomDTO> meetingSearch(MeetingRoomDTO meetingRoomDTO) {
		
		List<MeetingRoomDTO> ar = new ArrayList<MeetingRoomDTO>();
		try {
			ar = meetingRoomService.searchList(meetingRoomDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        return ar;
	}
	
	/****************************************************************************************/
	
    //calendarEventList
    @RequestMapping(value="calendarEventList", method=RequestMethod.POST)
    public List<CalendarEventDTO> calendarEventList(CalendarEventDTO calendarEventDTO) {
        logger.info("calendarEventList "+calendarEventDTO.toString());
        System.out.println("CalendarId = "+calendarEventDTO.getCalendarId());
        
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
    
    // calendarEventRemoveOne
    @RequestMapping(value="calendarEventRemoveOne", method=RequestMethod.POST)
    public Map<String, Boolean> calendarEventRemoveOne(CalendarEventDTO calendarEventDTO) {
        logger.info("calendarEventRemoveOne "+calendarEventDTO.toString());
        
        
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
    
    // calendarEventModify
    @RequestMapping(value="calendarEventModify", method=RequestMethod.POST)
    public Map<String, Boolean> calendarEventModify(CalendarEventDTO calendarEventDTO) {
        logger.info("calendarEventModify "+calendarEventDTO.toString());
        
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
