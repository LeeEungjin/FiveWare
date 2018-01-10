package com.five.ware.erp.storageRegist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.file.FileDAO;
import com.five.ware.file.FileDTO;
import com.five.ware.util.ListData;

@Service
public class StorageRegistService {
	
	@Inject
	private StorageRegistDAO storageRegistDAO;
	@Inject
	private FileDAO fileDAO;
	
	public int insert(StorageRegistDTO storageRegistDTO)throws Exception{
		
		List<FileDTO> ar = fileDAO.selectList(storageRegistDTO.getStorageCode());
		if(ar.size() > 0) {
			storageRegistDTO.setImgNull("true");
		}
		
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
	
	public Map<String, Object> selectOne(String storageCode)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		StorageRegistDTO storageRegistDTO=storageRegistDAO.selectOne(storageCode);
		List<FileDTO> ar = fileDAO.selectList(storageCode);
		
		map.put("storageRegistDTO", storageRegistDTO);
		map.put("files", ar);
		
		return map;
	}
	
	public int update(StorageRegistDTO storageRegistDTO)throws Exception{
		return storageRegistDAO.update(storageRegistDTO);
	}
	
	public int delete(String storageCode)throws Exception{
		return storageRegistDAO.delete(storageCode);
	}
}
