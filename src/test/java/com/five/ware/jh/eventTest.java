package com.five.ware.jh;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.five.ware.AbstractTest;
import com.five.ware.community.UploadDAO;
import com.five.ware.community.UploadDTO;
import com.five.ware.event.EventDAO;
import com.five.ware.event.EventDTO;

public class eventTest extends AbstractTest {
	
	@Inject
	private EventDAO eventDAO;
	@Inject
	private UploadDAO uploadDAO;
	
	public void insert()throws Exception{
		EventDTO eventDTO=new EventDTO();
		
		eventDTO.setEventNum(1);
		eventDTO.setEventName("1");
		eventDTO.setTemp("1");
		eventDTO.setEventSdate("1");
		eventDTO.setEventEdate("1");
		eventDTO.setEventOption("1");
		
		eventDAO.insert(eventDTO);
	}
	
	public void selectOne()throws Exception{
		EventDTO eventDTO=eventDAO.selectOne(12);
		List<UploadDTO> ar=uploadDAO.selectList(eventDTO.getEventNum());
		System.out.println(eventDTO.getEventName());
		System.out.println(ar.size());
		
	}
	
	@Test
	public void test() {
		
		try {
			this.selectOne();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}
