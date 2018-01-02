package com.five.ware;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.eb.storeRegist.StoreRegistDTO;
import com.five.ware.eb.storeRegist.StoreRegistService;

@Controller
@RequestMapping(value="/storeRegist/**")
public class StoreRegistController {
	
	@Inject
	private StoreRegistService storeRegistService;
	

	
	//storeRegist
	@RequestMapping(value="storeRegist")
	public String storeRegist(){
		return "erp/storeRegist";
	}
	
	
	//storeRegist insert
	@RequestMapping(value="storeRegistWrite" ,method=RequestMethod.POST)
	public String insert(StoreRegistDTO storeRegistDTO , RedirectAttributes rd){
		int result=0;
		
		return "redirect:./storeRegist";
		
	}
 }



