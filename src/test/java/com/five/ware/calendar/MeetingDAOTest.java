package com.five.ware.calendar;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.five.ware.AbstractTest;
import com.five.ware.meeting.MeetingDAO;
import com.five.ware.meeting.MeetingDTO;

public class MeetingDAOTest extends AbstractTest {

	@Autowired
	MeetingDAO meetingDAO;
	
	@Test
	public void test() {
		assertNotNull(meetingDAO);
	}
	
	@Test
	public void meeting() {
		selectList();
	}
	
	public void selectList() {
		try {
			List<MeetingDTO> ar = meetingDAO.selectList();
			
			assertTrue(ar.size() > 0);
			
			for (MeetingDTO meetingDTO : ar) {
				System.out.println(meetingDTO.getMeetingId());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
