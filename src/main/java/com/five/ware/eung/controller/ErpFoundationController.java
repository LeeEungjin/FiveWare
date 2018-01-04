package com.five.ware.eung.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.supplier.SupplierDTO;
import com.five.ware.erp.supplier.SupplierService;

@Controller
@RequestMapping(value="erp/foundation/**")
public class ErpFoundationController {
	
	@Inject
	private SupplierService supplierService;

	@RequestMapping(value="supplier", method=RequestMethod.GET)
	public ModelAndView supplierList() {	
		ModelAndView mv = new ModelAndView();
		
		try {
			mv = supplierService.selectList();
			mv.setViewName("erp/foundation/supplier");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping(value="supplier", method=RequestMethod.POST)
	public String supplierWrite(SupplierDTO supplierDTO) {
		String message = "";
		
		try {
			int result = supplierService.insert(supplierDTO);
			
			if(result > 0) {
				message = "redirect:./supplier";
			} else {
				// 등록이 실패될 경우 이동할 페이지
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return message;
	}
}
