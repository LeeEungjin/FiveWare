package com.five.ware.meeting;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MeetingRoomService {

	@Inject
	private MeetingRoomDAO meetingRoomDAO;
	
	
	public int insert(MeetingRoomDTO meetingRoomDTO) throws Exception {
		return meetingRoomDAO.insert(meetingRoomDTO);
	}
	
	public List<MeetingRoomDTO> searchList(MeetingRoomDTO meetingRoomDTO) throws Exception {
		return meetingRoomDAO.searchList(meetingRoomDTO);
	}
}
