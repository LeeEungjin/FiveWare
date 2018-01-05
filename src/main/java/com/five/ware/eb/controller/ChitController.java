package com.five.ware.eb.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.erp.accountRegist.AccountRegistDTO;
import com.five.ware.erp.chit.ChitDTO;
import com.five.ware.erp.chit.ChitService;
import com.five.ware.erp.tempRegist.TempRegistDTO;
import com.five.ware.util.ListData;

@Controller
@RequestMapping(value="/erp/**")
public class ChitController {
	
	@Inject
	private ChitService chitService;
	
	
	//chitDelete
	@RequestMapping(value="chitDelete")
	public String delete(String code)throws Exception{
		int result=chitService.delete(code);
		String message="fail";
		if(result>0){
			message="success";
		}
		
		return message;
	}
	
	//chitNapproval
	@RequestMapping(value="chitNapproval")
	public ModelAndView chitNapproval(ListData listData) throws Exception{
		String approval="미승인";
		ModelAndView mv=null;
		mv=chitService.chitApprovalList(listData,approval);
		mv.setViewName("/erp/account/chitNapproval");
		return mv;	
	}
	
	//chitApprovalUpdate
	@RequestMapping(value="chitApprovalUpdate",method=RequestMethod.POST)
	@ResponseBody
	public String update(String code)throws Exception{
		
		int result=chitService.update(code);
		String message="fail";
		if(result>0){
			message="success";
		}
		
		return message;
	};
	
	//chitApprovalSelectOne
	@RequestMapping(value="chitView")
	@ResponseBody
	public ChitDTO selectOne(String code) throws Exception{
		ChitDTO chitDTO;
		chitDTO=chitService.chitSelectOne(code);
		
		return chitDTO;
	}
	
	
	//list
	@RequestMapping(value="chitApproval")
	public ModelAndView selectList(ListData listData) throws Exception{
		String approval="승인";
		ModelAndView mv=null;
		mv=chitService.chitApprovalList(listData,approval);
		mv.setViewName("/erp/account/chitApproval");
		return mv;
	}
	//insert
	@RequestMapping(value="chitInsert",method=RequestMethod.POST)
	public String insert(ChitDTO chitDTO, RedirectAttributes rd) throws Exception{
		System.out.println("code : "+chitDTO.getCode());
		int result=0;
		
		result=chitService.insert(chitDTO);
		
		String message="fail";
		if(result>0){
			message="success";
		}
		
		return "redirect:./chit";
	}
	
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
	public 	ModelAndView chitTempList()throws Exception{
		ModelAndView mv=null;
		
		mv=chitService.chitTempList();
		mv.setViewName("/erp/account/chitTempResult");
		return mv;
			
	}
	
	@RequestMapping(value="chit")
	public String chit()throws Exception{
	
		
		return "/erp/account/chit";
	}

	
}
