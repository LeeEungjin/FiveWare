package com.five.ware.jh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.community.BlackListDTO;
import com.five.ware.community.BlackListService;

@Controller
@RequestMapping(value="/community/*")
public class BlackListController {
	
	@Autowired
	private BlackListService blackListService;
	
	@RequestMapping(value="blackList")
	public ModelAndView blackList()throws Exception{
		ModelAndView mv=null;
		
		mv=blackListService.blackList();
		
		return mv;
	}
	
	//insert
	@RequestMapping(value="reportInsert")
	@ResponseBody
	public String insert(BlackListDTO blackListDTO)throws Exception{
		int result=0;
		String message="report fail";	
		String code=blackListDTO.getNames().split(",",2)[1];
		String [] codes=blackListService.codeCheck(blackListDTO.getNum());
		int report=0;
		
			for (String string : codes) {
				
				if(string.equals(code)){
					result=1;
					message="이미 신고한 게시물입니다.";
				}
				
			}
			
			
			if(result==0){
				result=blackListService.reportUpdate(blackListDTO.getNum());
				
				report=blackListDTO.getReport();
				
				result=blackListService.namesUpdate(blackListDTO);
				
				if(result>0){
					message="해당 게시물을 신고하였습니다.";
				}
			}
			
	
		return message;
	}
	
}
