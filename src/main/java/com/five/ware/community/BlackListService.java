package com.five.ware.community;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class BlackListService {
	
	@Inject
	private BlackListDAO blackListDAO;
	
	public int insert(BlackListDTO blackListDTO)throws Exception{
		int result=0;
			
			result=blackListDAO.insert(blackListDTO);
			
		return result;
	}
	
	public String[] codeCheck(int num)throws Exception{
		String code=null;
		String [] codes=null;
		
		code=blackListDAO.codeCheck(num);
		
			codes=code.split(",");
		
		return codes;
	}
	
	public int reportUpdate(int num)throws Exception{
		int result=0;
		
			result=blackListDAO.reportUpdate(num);
			
		return result;
	}
	
	public int namesUpdate(BlackListDTO blackListDTO)throws Exception{
		int result=0;
		
			result=blackListDAO.namesUpdate(blackListDTO);
			
		return result;
	}
	
	public int reportCount(int num)throws Exception{
		int report=0;
		
		report=blackListDAO.reportCount(num);
		
		return report;
	}
	
}
