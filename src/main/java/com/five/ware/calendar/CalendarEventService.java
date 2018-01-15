package com.five.ware.calendar;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class CalendarEventService {

	@Inject
	private CalendarEventDAO calendarEventDAO;
	
	public int update(CalendarEventDTO calendarEventDTO) throws Exception {
		return calendarEventDAO.update(calendarEventDTO);
	}
	
	public int delete(CalendarEventDTO calendarEventDTO) throws Exception {
		return calendarEventDAO.delete(calendarEventDTO.getEventId());
	}
	
	public int insert(CalendarEventDTO calendarEventDTO) throws Exception {
		return calendarEventDAO.insert(calendarEventDTO);
	}
	
	public List<CalendarEventDTO> selectList() throws Exception {
		return calendarEventDAO.selectList();
	}
}
