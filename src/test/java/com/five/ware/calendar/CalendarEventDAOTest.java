package com.five.ware.calendar;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.five.ware.AbstractTest;

public class CalendarEventDAOTest extends AbstractTest {

	@Inject
	private CalendarEventDAO calendarEventDAO;
	
	@Test
	public void test() {
		assertNotNull(calendarEventDAO);
		System.out.println(calendarEventDAO);
	}
	
	@Test
	public void calendarEvent() {
		update();
	}
	
	public void update() {
		CalendarEventDTO calendarEventDTO = new CalendarEventDTO();
		calendarEventDTO.setCalendarId("test");
		calendarEventDTO.setDescription("aaa");
		calendarEventDTO.setSummary("aaa");
		calendarEventDTO.setEventId("7");
		
		try {
			int result = calendarEventDAO.update(calendarEventDTO);

			assertTrue(result > 0);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delete() {
		try {
			int result = calendarEventDAO.delete("5");
			
			assertTrue(result > 0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void insert() {
		CalendarEventDTO calendarEventDTO = new CalendarEventDTO();
		calendarEventDTO.setCalendarId("test");
		calendarEventDTO.setDescription("test");
		calendarEventDTO.setEndDate("2018-01-03");
		calendarEventDTO.setEndTime("14:00");
		calendarEventDTO.setStartDate("2018-01-03");
		calendarEventDTO.setStartTime("01:00");
		calendarEventDTO.setSummary("test");
		
		try {
			calendarEventDAO.insert(calendarEventDTO);
		} catch (Exception e) {
			e.printStackTrace();
		};
	}
	
	public void selectList() {
		try {
			List<CalendarEventDTO> ar = calendarEventDAO.selectList();
			
			assertTrue(ar.size() > 0);
			
			for (CalendarEventDTO calendarEventDTO : ar) {
				System.out.println(calendarEventDTO.getCalendarId());
				System.out.println(calendarEventDTO.getStartDateTime());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
