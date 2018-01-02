package com.five.ware.jh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.erp.menuRegist.MenuRegistDAO;
import com.five.ware.erp.menuRegist.MenuRegistDTO;
import com.five.ware.erp.menuRegist.MenuRegistService;
import com.five.ware.util.ListData;

@Controller
@RequestMapping(value="erp/foundation/**")
public class ErpController {
	
	@Autowired
	private MenuRegistService menuRegistService;
	
	@RequestMapping(value="menuRegist")
	public ModelAndView menuRegist(ListData listData){
		ModelAndView modelAndView=null;
		try{
		modelAndView=menuRegistService.selectList(listData);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
	}
	
	@RequestMapping(value="menuRegistWrite", method=RequestMethod.POST)
	public String menuRegist(MenuRegistDTO menuRegistDTO, RedirectAttributes rd){
		int result=0;
		String message="fail";

		try {
			result=menuRegistService.menuRegistInsert(menuRegistDTO);
			if(result>0){
				message="Success";
			}
			rd.addFlashAttribute("message", message);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:./menuRegist";
	}
	
/////////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="storageRegist", method=RequestMethod.GET)
	public void storageRegist(){}
}
