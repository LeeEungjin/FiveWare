package com.five.ware.erp.human.basis;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class SalService {

	@Inject
	SalDAO salDAO;
	
	public int salInsert(SalDTO salDTO) throws Exception{
		int result = salDAO.salInsert(salDTO);
		
		return result;
	}
	
	public List<SalDTO> salList(String search) throws Exception{
		List<SalDTO> ar = salDAO.salList(search);
		
		return ar;
	}
	
	public SalDTO salOne(String code) throws Exception{
		SalDTO salDTO = salDAO.salOne(code);
		
		return salDTO;
	}
	
	public int salUpdate(SalDTO salDTO) throws Exception{
		int result = salDAO.salUpdate(salDTO);
		
		return result;
	}
	
	public int salDelete(String code) throws Exception{
		int result = salDAO.salDelete(code);
		
		return result;
	}
}
