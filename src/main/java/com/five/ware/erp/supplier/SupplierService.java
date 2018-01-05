package com.five.ware.erp.supplier;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.util.ListData;
import com.five.ware.util.Pager;
import com.five.ware.util.RowNum;

@Service
public class SupplierService {

	@Inject
	private SupplierDAO supplierDAO;
	
	public int stop(Map<String, String> map) throws Exception {
		return supplierDAO.stop(map);
	}
	
	public int delete(String code) throws Exception {
		return supplierDAO.delete(code);
	}
	
	public int update(SupplierDTO supplierDTO) throws Exception {
		return supplierDAO.update(supplierDTO);
	}
	
	public int insert(SupplierDTO supplierDTO) throws Exception {
		return supplierDAO.insert(supplierDTO);
	}
	
	public SupplierDTO selectOne(String code) throws Exception {
		return supplierDAO.selectOne(code);
	}
	
	public ModelAndView selectList(ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		RowNum rowNum = listData.makeRow();
		Pager pager = listData.makePage(supplierDAO.totalCount(rowNum));
		List<SupplierDTO> ar = supplierDAO.selectList(rowNum);
		
		mv.addObject("list", ar).addObject("pager", pager);
		
		return mv;
	}
}
