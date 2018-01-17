package com.five.ware.jh.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.storageRegist.StorageRegistService;
import com.five.ware.erp.storeRegist.StoreRegistService;

@Controller
@RequestMapping(value="/srm/store/**")
public class AllStoreController {
	
	@Inject
	private StoreRegistService storeRegistService;
	
	//List
	@RequestMapping(value="allStoreList")
	public ModelAndView allStoreList()throws Exception{
		
		ModelAndView mv=null;
		
		mv=storeRegistService.allStoreList();
		mv.setViewName("/srm/store/allStoreInfo");
		
		return mv;
	}
	
	@RequestMapping(value="mapTest")
	public String mapTest()throws Exception{
		return "/srm/store/mapTest";
	}

}
