package com.five.ware.eb.storeRegist;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class StoreRegistService {

	@Inject
	private StoreRegistDAO storeRegistDAO;
	
	public int insert(StoreRegistDTO storeRegistDTO) throws Exception{
		
		int result=storeRegistDAO.insert(storeRegistDTO);
		
		return result;
	}
}
