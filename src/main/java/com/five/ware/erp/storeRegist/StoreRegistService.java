package com.five.ware.erp.storeRegist;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.util.ListData;
import com.five.ware.util.Pager;
import com.five.ware.util.RowNum;

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
		
		RowNum rowNum=listData.makeRow();
		
		int totalCount=storeRegistDAO.totalCount(rowNum);
		
		Pager pager=listData.makePage(totalCount);
		
		List<StoreRegistDTO> ar=new ArrayList<StoreRegistDTO>();
		
		ar=storeRegistDAO.selectList(rowNum,listData);
		
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("list",ar);
		mv.addObject("pager", pager);
		
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
