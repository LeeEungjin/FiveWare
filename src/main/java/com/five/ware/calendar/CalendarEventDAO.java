package com.five.ware.calendar;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarEventDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static String NAMESPACE = "calendarEventMapper.";

	
	public int update(CalendarEventDTO calendarEventDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"eventUpdate", calendarEventDTO);
	}
	
	public int delete(String eventId) throws Exception {
		return sqlSession.delete(NAMESPACE+"eventDelete", eventId);
	}
	
	public int insert(CalendarEventDTO calendarEventDTO) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("calendarId", calendarEventDTO.getCalendarId());
		map.put("summary", calendarEventDTO.getSummary());
		map.put("startDate", calendarEventDTO.getStartDate());
		map.put("startTime", calendarEventDTO.getStartTime());
		map.put("endDate", calendarEventDTO.getEndDate());
		map.put("endTime", calendarEventDTO.getEndTime());
		map.put("description", calendarEventDTO.getDescription());
		
		return sqlSession.insert(NAMESPACE+"eventInsert", map);
	}
	
	public List<CalendarEventDTO> selectList(String calendarId) throws Exception {
		return sqlSession.selectList(NAMESPACE+"eventList", calendarId);
	}
}
