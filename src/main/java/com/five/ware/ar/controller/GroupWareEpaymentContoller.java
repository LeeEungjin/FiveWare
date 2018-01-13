package com.five.ware.ar.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.groupware.epayment.FormListDTO;
import com.five.ware.groupware.epayment.FormListService;

@Controller
@RequestMapping(value="GroupWare/epayment/**")
public class GroupWareEpaymentContoller {

	@Inject
	FormListService formListService;
	
	
	//pendency 미결함
	@RequestMapping(value="epaymentPendency")
	public void epaymentPendency(){
		
	}
	
	//determine 기결함
	@RequestMapping(value="epaymentDetermine")
	public void epaymentDetermine(){
		
	}
	
	//return 반려함
	@RequestMapping(value="epaymentReturn")
	public void epaymentReturn(){
		
	}
	
	
	
	@RequestMapping(value="formList")
	public ModelAndView formList(String search) throws Exception{
		List<FormListDTO> ar = formListService.formList(search);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("listnum", ar.size());
		mv.addObject("formList", ar);
		mv.setViewName("GroupWare/epayment/formList");
		
		return mv;
	}
	
	@RequestMapping(value="explanatory")
	public void explanatory() throws Exception{
		
	}
}
