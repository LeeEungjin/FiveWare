package com.five.ware.erp.menuRegist;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MenuRegistService {
	
	@Inject
	private MenuRegistDAO menuRegistDAO;
	
	public int menuRegistInsert(MenuRegistDTO menuRegistDTO)throws Exception{
		int result=menuRegistDAO.memuRegistinsert(menuRegistDTO);
		return result;
	}
	

}
