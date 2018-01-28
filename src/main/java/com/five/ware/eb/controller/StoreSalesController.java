package com.five.ware.eb.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.menuRegist.MenuRegistService;
import com.five.ware.erp.storeRegist.StoreRegistService;
import com.five.ware.storeSales.StoreSalesService;
import com.five.ware.util.ListData;

@Controller
@RequestMapping(value="/erp/**")
public class StoreSalesController {

	@Inject
	StoreRegistService storeRegistService;
	@Inject
	MenuRegistService menuRegistService;
	@Inject
	StoreSalesService storeSalesService;
	
	
	@RequestMapping(value="storeSales")
	public String storeSales(ListData listData, @RequestParam(defaultValue="no", required=false)String order, @RequestParam(defaultValue="no", required=false)String menukind, Model model) throws Exception{
	
		storeRegistService.selectList(listData,model);
		menuRegistService.storeSelectList(listData, order, menukind, model);
	
		return "/erp/account/storeSales";
	}
	
	
	@RequestMapping(value="storeSearch", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView storeSearch(String store, String product, String regdate)throws Exception{
		ModelAndView mv=new ModelAndView();
		mv=storeSalesService.salesList(store, product, regdate);
		mv.setViewName("/erp/account/storeSalesResult");
		
		
		
		return mv;
	}


}
