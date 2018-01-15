package com.five.ware.calendar;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDAO {

	@Inject
	private SqlSession sqlSession;
	private static String NAMESPACE = "calendarMapper.";
	
	public int update(CalendarDTO calendarDTO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("calendarId", calendarDTO.getCalendarId());
		map.put("title", calendarDTO.getTitle());
		
		return sqlSession.update(NAMESPACE+"calendarUpdate", map);
	}
	
	public int delete(String calendarId) throws Exception {
		return sqlSession.delete(NAMESPACE+"calendarDelete", calendarId);
	}
	
	public int insert(CalendarDTO calendarDTO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("calendarId", calendarDTO.getCalendarId());
		map.put("title", calendarDTO.getTitle());
		
		return sqlSession.insert(NAMESPACE+"calendarInsert", map);
	}
	
	public List<CalendarDTO> selectList() throws Exception {
		return sqlSession.selectList(NAMESPACE+"calendarList");
	}
}
