package com.five.ware.erp.supplier;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class SupplierService {

	@Inject
	private SupplierDAO supplierDAO;
	
	public int delete(String code) throws Exception {
		return supplierDAO.delete(code);
	}
	
	public int update(SupplierDTO supplierDTO) throws Exception {
		return supplierDAO.update(supplierDTO);
	}
	
	public ModelAndView selectList() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<SupplierDTO> ar = supplierDAO.selectList();
		
		mv.addObject("list", ar);
		
		return mv;
	}
	
	public int insert(SupplierDTO supplierDTO) throws Exception {
		return supplierDAO.insert(supplierDTO);
	}
	
	public SupplierDTO selectOne(String code) throws Exception {
		return supplierDAO.selectOne(code);
	}
}
