package com.five.ware.jh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.storageRegist.StorageRegistService;
import com.five.ware.erp.storeRegist.StoreRegistDTO;
import com.five.ware.erp.storeRegist.StoreRegistService;

@Controller
@RequestMapping(value="/srm/store/**")
public class AllStoreController {
	
	@Inject
	private StoreRegistService storeRegistService;
	
	//List
	@RequestMapping(value="allStoreList")
	public String allStoreList(Model model)throws Exception{

		List<StoreRegistDTO> storeList=storeRegistService.allStoreList();
		
		model.addAttribute("storeList", storeList);
		
		return "srm/store/allStoreList";
	}

}
