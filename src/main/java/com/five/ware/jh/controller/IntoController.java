package com.five.ware.jh.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.into.IntoDTO;
import com.five.ware.erp.into.IntoService;
import com.five.ware.erp.menuRegist.MenuRegistDTO;
import com.five.ware.erp.product.ProductDTO;
import com.five.ware.erp.storageRegist.StorageRegistDTO;
import com.five.ware.erp.supplier.SupplierDTO;
import com.five.ware.mater.MaterDTO;
import com.five.ware.order.OrderDTO;

@Controller
@RequestMapping(value="erp/into/**")
public class IntoController {
	
	@Autowired
	private IntoService intoService;
	
	@RequestMapping(value="intoMaterOne", method=RequestMethod.POST)
	public ModelAndView materOne(String kind) {
		ModelAndView mv = new ModelAndView();
		List<IntoDTO> ar = null;
		
		try {
			ar = intoService.intoMater(kind);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("list", ar);
		mv.setViewName("erp/into/materTable");
		
		return mv;
	}
	
	@RequestMapping(value="intoMater", method=RequestMethod.POST)
	public ModelAndView materList(String tableName) {
		ModelAndView mv = new ModelAndView();
		List<IntoDTO> ar = null;
		
		try {
			ar = intoService.intoMater();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("list", ar);
		mv.setViewName("erp/into/"+tableName.toLowerCase()+"Table");
		
		return mv;
	}
	
	
	@RequestMapping(value="intoStorage", method=RequestMethod.POST)
	public ModelAndView storageList(String tableName) {
		ModelAndView mv = new ModelAndView();
		List<IntoDTO> ar = null;
		
		try {
			ar = intoService.intoStorage();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("list", ar);
		mv.setViewName("erp/into/"+tableName.toLowerCase()+"Table");
		
		return mv;
	}
	
	@RequestMapping(value="intoMenu", method=RequestMethod.POST)
	public ModelAndView menuList(String tableName) {
		ModelAndView mv = new ModelAndView();
		List<IntoDTO> ar = null;
		
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
		List<IntoDTO> ar = null;
		
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
	public ModelAndView supplierList(String tableName){
		ModelAndView mv = new ModelAndView();
		List<IntoDTO> ar = new ArrayList<IntoDTO>();
		
		try {
			ar = intoService.intoSupplier();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("list", ar);
		mv.setViewName("erp/into/"+tableName.toLowerCase()+"Table");
		
		return mv;
	}
	
	@RequestMapping(value="intoOrder", method=RequestMethod.POST)
	public ModelAndView orderList(String tableName){
		ModelAndView mv = new ModelAndView();
		List<IntoDTO> ar = new ArrayList<IntoDTO>();
		
		try {
			ar = intoService.intoOrder();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("table", tableName);
		mv.addObject("list", ar);
		mv.setViewName("erp/into/"+tableName.toLowerCase()+"Table");
		
		return mv;
	}
	
	@RequestMapping(value="intoList", method=RequestMethod.GET)
	public void go() {};
	
}
