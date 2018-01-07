package com.five.ware.erp.notice;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MeetingRoomDAO {

	@Inject
	private SqlSession sqlSession;
	private final String namespace="MeetingRoomMapper.";
	
	public int insert(MeetingRoomDTO meetingRoomDTO) throws Exception	{
		int result = sqlSession.insert(namespace+"insert", meetingRoomDTO);
		return result;
	}
}
