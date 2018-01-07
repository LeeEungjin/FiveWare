package com.five.ware.erp.notice;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MeetingRoomService {
	
	@Inject
	private MeetingRoomDAO meetingRoomDAO;

	public int insert(MeetingRoomDTO meetingRoomDTO) throws Exception	{
		int result = meetingRoomDAO.insert(meetingRoomDTO);
		
		return result;
	}
}
