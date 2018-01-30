package com.five.ware.calendar;

import static org.junit.Assert.*;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.five.ware.AbstractTest;

public class CalendarDAOTest extends AbstractTest {

	
	@Autowired
	private CalendarDAO calendarDAO;
	
	@Test
	public void test() {
		assertNotNull(calendarDAO);
		System.out.println(calendarDAO);
	}
	
	@Test
	public void calendar() {

	}
	
	public void insert() {
		CalendarDTO calendarDTO = new CalendarDTO();
		calendarDTO.setCalendarId("test");
		calendarDTO.setTitle("test");
 		try {
			int result = calendarDAO.insert(calendarDTO);
			
			assertTrue(result > 0);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void selectList() {
		try {
			List<CalendarDTO> ar = calendarDAO.selectList();
			
			assertTrue(ar.size() > 0);
			
			for (CalendarDTO calendarDTO : ar) {
				System.out.println(calendarDTO.getCalendarId());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
