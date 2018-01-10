package com.five.ware.jh.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.into.IntoService;
import com.five.ware.erp.menuRegist.MenuRegistDTO;
import com.five.ware.erp.product.ProductDTO;
import com.five.ware.erp.supplier.SupplierDTO;

@Controller
@RequestMapping(value="erp/into/**")
public class IntoController {
	
	@Autowired
	private IntoService intoService;
	
	@RequestMapping(value="intoMenu", method=RequestMethod.POST)
	public ModelAndView menuList(String tableName) {
		ModelAndView mv = new ModelAndView();
		List<MenuRegistDTO> ar = null;
		
		try {
			ar = intoService.intoMenuregist();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("list", ar);
		mv.setViewName("erp/into/"+tableName.toLowerCase()+"Table");
		
		return mv;
	}
	
	@RequestMapping(value="intoProduct", method=RequestMethod.POST)
	public ModelAndView productList(String tableName) {
		ModelAndView mv = new ModelAndView();
		List<ProductDTO> ar = null;
		
		try {
			ar = intoService.intoProduct();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("list", ar);
		mv.setViewName("erp/into/"+tableName.toLowerCase()+"Table");
		
		return mv;
	}
	
	@RequestMapping(value="intoSupplier", method=RequestMethod.POST)
	public ModelAndView supplierList(){
		ModelAndView mv = new ModelAndView();
		List<SupplierDTO> ar = new ArrayList<SupplierDTO>();
		
		try {
			ar = intoService.intoSupplier();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("list", ar);
		mv.setViewName("erp/into/supplierTable");
		
		return mv;
	}
	
	@RequestMapping(value="intoList", method=RequestMethod.GET)
	public void go() {};
	
}
