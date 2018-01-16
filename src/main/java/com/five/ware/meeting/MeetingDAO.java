package com.five.ware.meeting;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MeetingDAO {
	
	@Inject
	private	SqlSession sqlSession;
	private static String NAMESPACE = "meetingMapper.";
	
	public int update(MeetingDTO meetingDTO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("meetingId", meetingDTO.getMeetingId());
		map.put("meetingName", meetingDTO.getMeetingName());
		
		return sqlSession.update(NAMESPACE+"meetingUpdate", map);
	}
	
	public int delete(String meetingId) throws Exception {
		return sqlSession.delete(NAMESPACE+"meetingDelete", meetingId);
	}
	
	public int insert(MeetingDTO meetingDTO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("meetingId", meetingDTO.getMeetingId());
		map.put("meetingName", meetingDTO.getMeetingName());
		
		return sqlSession.insert(NAMESPACE+"meetingInsert", map);
	}
	
	public List<MeetingDTO> selectList() throws Exception {
		return sqlSession.selectList(NAMESPACE+"meetingList");
	}
}
