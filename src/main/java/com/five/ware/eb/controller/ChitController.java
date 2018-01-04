package com.five.ware.eb.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.accountRegist.AccountRegistDTO;
import com.five.ware.erp.chit.ChitService;
import com.five.ware.erp.tempRegist.TempRegistDTO;

@Controller
@RequestMapping(value="/erp/**")
public class ChitController {
	
	@Inject
	private ChitService chitService;
	
	
	
	//accountList
	@RequestMapping(value="chitAccountList")
	@ResponseBody
	public ModelAndView chitAccountList() throws Exception{
		ModelAndView mv=null;
		mv=chitService.chitAccountList();
		mv.setViewName("/erp/account/chitAccountResult");
		
		return mv;
	}
	
	//tempList
	@RequestMapping(value="chitTempList")
	@ResponseBody
	public List<String> chitTempList()throws Exception{

		List<String> ar=chitService.chitTempList();
		
		return ar;
			
	}
	
	@RequestMapping(value="chit")
	public String chit()throws Exception{
	
		
		return "/erp/account/chit";
	}

	
}
