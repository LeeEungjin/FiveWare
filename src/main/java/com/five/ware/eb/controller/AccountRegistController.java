package com.five.ware.eb.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.erp.accountRegist.AccountRegistDTO;
import com.five.ware.erp.accountRegist.AccountRegistService;
import com.five.ware.util.ListData;

@Controller
@RequestMapping(value="/erp/**")
public class AccountRegistController {

	@Inject
	private AccountRegistService accountRegistService;
	
	//list
	@RequestMapping(value="accountRegist")
	public ModelAndView selectList(ListData listData)throws Exception{
		ModelAndView mv=null;
		mv=accountRegistService.selectList(listData);
		mv.setViewName("/erp/account/accountRegist");
		
		return mv;
	}
	
	//insert
	@RequestMapping(value="accountRegistWrite" ,method=RequestMethod.POST)
	public String insert(AccountRegistDTO accountRegistDTO, RedirectAttributes rd) throws Exception{
		
		int result=0;
		
		result=accountRegistService.insert(accountRegistDTO);
		
		String message="fail";
		if(result>0){
			message="success";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./accountRegist";
	}
}
