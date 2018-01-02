package com.five.ware.erp.storeRegist;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class StoreRegistService {

	@Inject
	private StoreRegistDAO storeRegistDAO;
	
	public int insert(StoreRegistDTO storeRegistDTO) throws Exception{
		
		int result=storeRegistDAO.insert(storeRegistDTO);
		
		return result;
	}
	
	public ModelAndView selectList() throws Exception{
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/erp/storeRegist");
		mv.addObject("list",storeRegistDAO.selectList());
		
		return mv;
	}

	
}
