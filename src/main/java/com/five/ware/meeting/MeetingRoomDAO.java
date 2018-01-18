package com.five.ware.meeting;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MeetingRoomDAO {

	@Inject
	private SqlSession sqlSession;
	private static String NAMESPACE = "meetingRoomMapper.";
	
	public int delete(String eventId) throws Exception {
		return sqlSession.delete(NAMESPACE+"meetingRoomDelete", eventId);
	}
	
	public int insert(MeetingRoomDTO meetingRoomDTO) throws Exception {
		int eventId = sqlSession.selectOne(NAMESPACE+"getEventId");
		meetingRoomDTO.setEventId(eventId);
		
		return sqlSession.insert(NAMESPACE+"meetingRoomInsert", meetingRoomDTO);
	}
	
	public List<MeetingRoomDTO> searchList(MeetingRoomDTO meetingRoomDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"meetingSearchList", meetingRoomDTO);
	}
}
