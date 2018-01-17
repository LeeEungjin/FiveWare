package com.five.ware.time;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class TimeService {
	
	
	@Inject
	private TimeDAO timeDAO;
	
	//selectOne
	public TimeDTO selectOne(TimeDTO timeDTO) throws Exception{
		timeDTO=timeDAO.selectOne(timeDTO);
		
		return timeDTO;
	}
	
	//update
	public int update(TimeDTO timeDTO)throws Exception{
		int result=timeDAO.update(timeDTO);
		
		return result;
	}
	
	//insert
	public int insert(TimeDTO timeDTO)throws Exception{
		int result=timeDAO.insert(timeDTO);
		
		return result;
		
	}

}
