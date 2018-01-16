package com.five.ware.calendar;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.five.ware.AbstractTest;
import com.five.ware.meeting.MeetingRoomDAO;
import com.five.ware.meeting.MeetingRoomDTO;

public class MeetingRoomDAOTest extends AbstractTest {
	
	@Inject
	private MeetingRoomDAO meetingRoomDAO;

	@Test
	public void test() {
		assertNotNull(meetingRoomDAO);
	}
	
	@Test
	public void meeting() {
		meetingSearch();
	}
	
	public void meetingSearch() {
		MeetingRoomDTO meetingRoomDTO = new MeetingRoomDTO();
		meetingRoomDTO.setMeetingName("È¸ÀÇ½ÇA");
		meetingRoomDTO.setReservDate("2018-01-14");
		
		try {
			List<MeetingRoomDTO> ar = meetingRoomDAO.searchList(meetingRoomDTO);
			
			assertTrue(ar.size() > 0);
			
			for (MeetingRoomDTO roomDTO : ar) {
				System.out.println(roomDTO.getMeetingName());
				System.out.println("---------------------------------");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
