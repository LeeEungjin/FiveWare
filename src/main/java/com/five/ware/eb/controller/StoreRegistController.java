package com.five.ware.eb.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.erp.storeRegist.StoreRegistDTO;
import com.five.ware.erp.storeRegist.StoreRegistService;
import com.five.ware.util.ListData;

@Controller
@RequestMapping(value="/erp/**")
public class StoreRegistController {
	
	@Inject
	private StoreRegistService storeRegistService;
	
	
	//storeRegist
	@RequestMapping(value="storeRegist")
	public String selectList(ListData listData,Model model) throws Exception{
	
		
		storeRegistService.selectList(listData,model);
		
		return "/erp/account/storeRegist";
	}
	
	
	//insert
	@RequestMapping(value="storeRegistWrite" ,method=RequestMethod.POST)
	public String insert(StoreRegistDTO storeRegistDTO , RedirectAttributes rd){
		
		int result=0;
		 
		try {
			result=storeRegistService.insert(storeRegistDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String message="fail";
		if(result>0){
			message="success";
		}
		
		rd.addFlashAttribute("message", message);
		
		
		return "redirect:./storeRegist";
		
	}
	
	//selectOne
	@RequestMapping(value="storeRegistView")
	@ResponseBody
	public StoreRegistDTO selectOne(String code)throws Exception{
		
		StoreRegistDTO storeRegistDTO;
		storeRegistDTO=storeRegistService.selectOne(code);
		
		return storeRegistDTO;
	}
	
	//delete
	@RequestMapping(value="storeRegistDelete")
	@ResponseBody
	public String delete(String code){
		String ar []=code.split(",");
		
		String message="fail";
		
		for(int i=0; i<ar.length; i++){
		
			int result;
			
			try {
				result = storeRegistService.delete(ar[i]);
			
				if(result>0){
					message="success";
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		
		return message;
	}
	
	//update
	@RequestMapping(value="storeRegistUpdate")
	public String update(RedirectAttributes rd, StoreRegistDTO storeRegistDTO) throws Exception{

		int result=storeRegistService.update(storeRegistDTO);
	
		String message="fail";
		if(result>0){
			message="success";
		}
		
		
		rd.addFlashAttribute("message",message);
		
		return "redirect:./storeRegist";
	}
	
 }



