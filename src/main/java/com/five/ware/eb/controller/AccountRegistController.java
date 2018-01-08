package com.five.ware.eb.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	//update
	@RequestMapping(value="accountRegistUpdate",method=RequestMethod.POST)
	public String update(AccountRegistDTO accountRegistDTO, RedirectAttributes rd) throws Exception{
		int result=accountRegistService.update(accountRegistDTO);
		
		String message="fail";
		if(result>0){
			message="success";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./accountRegist";
		
	}
	
	//delete
	@RequestMapping(value="accountRegistDelete" ,method=RequestMethod.GET)
	@ResponseBody
	public String delete(String code) throws Exception{
		String ar [] =code.split(",");
		
		String message="fail";
		for(int i=0; i<ar.length; i++){
	
			int result;
			
			try {
				result = accountRegistService.delete(ar[i]);
		
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
	
	//selectOne
	@RequestMapping(value="accountRegistView")
	@ResponseBody
	public AccountRegistDTO selectOne(String code) throws Exception{
		AccountRegistDTO accountRegistDTO=accountRegistService.selectOne(code);
		
		return accountRegistDTO;
	}
}
