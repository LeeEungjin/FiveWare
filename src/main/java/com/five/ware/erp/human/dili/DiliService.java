package com.five.ware.erp.human.dili;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class DiliService {

	@Inject
	DiliDAO diliDAO;
	
	public int diliInsert(DiliDTO diliDTO) throws Exception{
		int result = diliDAO.diliInsert(diliDTO);
		
		return result;
	}
	
	public List<DiliDTO> diliList(String search) throws Exception{
		List<DiliDTO> ar = diliDAO.diliList(search);
		
		return ar;
	}
	
	public DiliDTO diliOne(String code) throws Exception{
		DiliDTO diliDTO = diliDAO.diliOne(code);
		
		return diliDTO;
	}
	
	public int diliUpdate(DiliDTO diliDTO) throws Exception{
		int result = diliDAO.diliUpdate(diliDTO);
		
		return result;
	}
	
	public int diliDelete(String code) throws Exception{
		int result = diliDAO.diliDelete(code);
		
		return result;
	}
}
