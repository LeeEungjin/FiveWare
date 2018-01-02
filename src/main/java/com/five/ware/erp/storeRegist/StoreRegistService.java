package com.five.ware.erp.storeRegist;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.util.ListData;

@Service
public class StoreRegistService {

	@Inject
	private StoreRegistDAO storeRegistDAO;
	
	//insert
	public int insert(StoreRegistDTO storeRegistDTO) throws Exception{
		
		int result=storeRegistDAO.insert(storeRegistDTO);
		
		return result;
	}
	
	
	//list
	public ModelAndView selectList(ListData listData) throws Exception{
		int totalCount=storeRegistDAO.totalCount(listData.makeRow());
		ModelAndView mv=new ModelAndView();
		mv.setViewName("/erp/storeRegist");
		mv.addObject("list",storeRegistDAO.selectList(listData.makeRow()));
		mv.addObject("pager", listData.makePage(totalCount));
		
		
		return mv;
	}
	
	
	//selectOne
	public StoreRegistDTO selectOne(String code) throws Exception{
		
		StoreRegistDTO storeRegistDTO=storeRegistDAO.selectOne(code);
		return storeRegistDTO;
	}
	
	//delete
	public int delete(String code) throws Exception{
		int result=storeRegistDAO.delete(code);
		
		return result;
	}
	
	//update
	public int update(StoreRegistDTO storeRegistDTO)throws Exception{
		
		int result=storeRegistDAO.update(storeRegistDTO);
		
		return result;
		
	}
}
