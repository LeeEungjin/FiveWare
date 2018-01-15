package com.five.ware.ar.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.groupware.epayment.EpaymentDTO;
import com.five.ware.groupware.epayment.EpaymentService;
import com.five.ware.groupware.epayment.FormListDTO;
import com.five.ware.groupware.epayment.FormListService;

@Controller
@RequestMapping(value="GroupWare/epayment/**")
public class GroupWareEpaymentContoller {

	@Inject
	FormListService formListService;
	@Inject
	EpaymentService epaymentService;
	
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
	public ModelAndView explanatory() throws Exception{
		Calendar ca = Calendar.getInstance();
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		
		String sysdate = sd.format(ca.getTime());
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("sysdate", sysdate);
		mv.setViewName("GroupWare/epayment/explanatory");
		
		return mv;
	}
	
	@RequestMapping(value="epaymentInsert", method=RequestMethod.POST)
	public ModelAndView epaymentInsert(EpaymentDTO epaymentDTO) throws Exception{
		int result = epaymentService.epaymentInsert(epaymentDTO);
		
		String message = "결재 요청 실패";
		
		if(result>0){
			message= "결재가 요청되었습니다.";
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("message", message);
		mv.addObject("addr", "explanatory"); // 주소 바꿔야함
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@RequestMapping(value="explanatory_modal")
	public void epaymentModal() throws Exception{
		System.out.println("들어오냐?");
	}
	
	@RequestMapping(value="signData")
	@ResponseBody
	public List<Object> signData() throws Exception{
		List<String> temps = epaymentService.tempList();
		List<Object> ar = new ArrayList<Object>();
		
		ar.add(temps);
		
		return ar;
	}
	
	@RequestMapping(value="tempMember")
	@ResponseBody
	public List<String> tempMember(String temp) throws Exception{
		List<String> members=epaymentService.tempMember(temp);
		
		return members;
	}
}
