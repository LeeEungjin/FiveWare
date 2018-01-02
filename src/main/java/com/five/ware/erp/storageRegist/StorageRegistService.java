package com.five.ware.erp.storageRegist;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.util.ListData;

@Service
public class StorageRegistService {
	
	@Inject
	private StorageRegistDAO storageRegistDAO;
	
	public int insert(StorageRegistDTO storageRegistDTO)throws Exception{
		int result=storageRegistDAO.insert(storageRegistDTO);
		
		return result;
	}
	
	public ModelAndView selectList(ListData listData)throws Exception{
		ModelAndView mv=new ModelAndView();
		int totalCount=storageRegistDAO.totalCount(listData.makeRow());
		
		mv.setViewName("erp/foundation/storageRegist");
		mv.addObject("pager", listData.makePage(totalCount));
		mv.addObject("sr_list", storageRegistDAO.selectList(listData.makeRow()));
		
		return mv;
	}
	
	public StorageRegistDTO selectOne(String storageCode)throws Exception{
		StorageRegistDTO storageRegistDTO=storageRegistDAO.selectOne(storageCode);
		
		return storageRegistDTO;
	}
	
	public int update(StorageRegistDTO storageRegistDTO)throws Exception{
		return storageRegistDAO.update(storageRegistDTO);
	}
	
	public int delete(String storageCode)throws Exception{
		return storageRegistDAO.delete(storageCode);
	}
}
