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
	
	public List<MeetingRoomDTO> searchList(MeetingRoomDTO meetingRoomDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"meetingSearchList", meetingRoomDTO);
	}
}
