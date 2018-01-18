package com.five.ware.calendar;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.five.ware.meeting.MeetingRoomDAO;

@Service @Transactional
public class CalendarEventService {

	@Inject
	private CalendarEventDAO calendarEventDAO;
	
	@Inject
	private MeetingRoomDAO meetingRoomDAO;
	
	public int update(CalendarEventDTO calendarEventDTO) throws Exception {
		return calendarEventDAO.update(calendarEventDTO);
	}
	
	public int delete(CalendarEventDTO calendarEventDTO) throws Exception {
		int result = meetingRoomDAO.delete(calendarEventDTO.getEventId());
		result = calendarEventDAO.delete(calendarEventDTO.getEventId());;
		return result;
	}
	
	public int insert(CalendarEventDTO calendarEventDTO) throws Exception {
		return calendarEventDAO.insert(calendarEventDTO);
	}
	
	public List<CalendarEventDTO> selectList(String calendarId) throws Exception {
		return calendarEventDAO.selectList(calendarId);
	}
}
