package com.five.ware.calendar;

import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class CalendarService {
	
	@Inject
	private CalendarDAO calendarDAO;
	
	public int update(CalendarDTO calendarDTO) throws Exception {
		return calendarDAO.update(calendarDTO);
	}
	
	public int delete(String calendarId) throws Exception {
		return calendarDAO.delete(calendarId);
	}
	
	public int insert(CalendarDTO calendarDTO) throws Exception {
		String calendarId = UUID.randomUUID().toString()+"@group.fiveware.com";
		calendarDTO.setCalendarId(calendarId);
		
		return calendarDAO.insert(calendarDTO);
	}
	
	public List<CalendarDTO> selectList() throws Exception {
		return calendarDAO.selectList();
	}

}
