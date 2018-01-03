package com.five.ware.eb.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.erp.tempRegist.TempRegistDTO;
import com.five.ware.erp.tempRegist.TempRegistService;
import com.five.ware.util.ListData;

@Controller
@RequestMapping(value="/erp/**")
public class TempRegistContoller {

	@Inject
	private TempRegistService tempRegistService;
	
	
	//delete
	@RequestMapping(value="tempRegistDelete")
	@ResponseBody
	public String delete(String code) throws Exception{
		
		int result=tempRegistService.delete(code);
		
		String message="fail";
		if(result>0){
			message="success";
		}		
		return message;
	}
	//update
	@RequestMapping(value="tempRegistUpdate",method=RequestMethod.POST)
	public String update(RedirectAttributes rd,TempRegistDTO tempRegistDTO) throws Exception{
		
		int result=tempRegistService.update(tempRegistDTO);
		
		String message="fail";
		if(result>0){
			message="success";
		}
		
		rd.addFlashAttribute("message", message);
		
		
		return "redirect:./tempRegist";
	}
	
	//selectOne
	@RequestMapping(value="tempRegistView")
	@ResponseBody
	public TempRegistDTO selectOne(String code) throws Exception{
		TempRegistDTO tempRegistDTO;
		tempRegistDTO=tempRegistService.selectOne(code);
		
		return tempRegistDTO;
	}
	
	//list
	@RequestMapping(value="tempRegist")
	public ModelAndView selectList(ListData listData) throws Exception{
		ModelAndView mv=null;
		mv=tempRegistService.selectList(listData);
		mv.setViewName("/erp/tempRegist");
		
		return mv;
	}
	
	
	//insert
	@RequestMapping(value="tempRegistWrite" ,method=RequestMethod.POST)
	public String insert(TempRegistDTO tempRegistDTO, RedirectAttributes rd){
		
	int result=0;
	try {
		result=tempRegistService.insert(tempRegistDTO);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	String message="fail";
	if(result>0){
		message="success";
	}
		
	rd.addFlashAttribute("message", message);
	
		return "redirect:./tempRegist";
	}
}
