package com.five.ware.meeting;

import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MeetingService {
	
	@Inject
	private MeetingDAO meetingDAO;
	
	public int update(MeetingDTO meetingDTO) throws Exception {
		return meetingDAO.update(meetingDTO);
	}
	
	public int delete(String meetingId) throws Exception {
		return meetingDAO.delete(meetingId);
	}
	
	public int insert(MeetingDTO meetingDTO) throws Exception {
		String meetingId = UUID.randomUUID().toString()+"@meeting.fiveware.com";
		meetingDTO.setMeetingId(meetingId);
		
		return meetingDAO.insert(meetingDTO);
	}
	
	public List<MeetingDTO> selectList() throws Exception {
		return meetingDAO.selectList();
	}

}
