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
import com.five.ware.util.ListData;

@Controller
@RequestMapping(value="GroupWare/epayment/**")
public class GroupWareEpaymentContoller {

	@Inject
	FormListService formListService;
	@Inject
	EpaymentService epaymentService;
	
	
	//내가 올린 결재문서만 보기
	@RequestMapping(value="epaymentDispatch")
	public String epaymentDispatch(){
		return "GroupWare/epayment/epaymentDispatch";
	}
	
	
	//반려함에서 삭제
	@RequestMapping(value="epaymentDelete")
	@ResponseBody
	public String epaymentDelete(String num){
		
		int result=0;
		try {
			result=epaymentService.epaymentDelete(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String message="fail";
		if(result>0){
			message="success";
		}
		
		return message;
	}
	
	//상세보기
	@RequestMapping(value="epaymentView")
	@ResponseBody
	public EpaymentDTO epaymentView(String num){
		
		EpaymentDTO epaymentDTO = null;
		try {
			epaymentDTO = epaymentService.epaymentView(num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return epaymentDTO;
	}
	
	//pendency 미결함
	@RequestMapping(value="epaymentPendency")
	public ModelAndView epaymentPendency(ListData listData){

		ModelAndView mv=null;
		listData.setResult("미결");
		
		try {
			mv=epaymentService.epaymentList(listData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName("GroupWare/epayment/epaymentPendency");
		
		return mv;
		
		
	}
	
	//determine 기결함
	@RequestMapping(value="epaymentDetermine")
	public ModelAndView epaymentDetermine(ListData listData){
		ModelAndView mv=null;
		listData.setResult("기결");
		
		try {
			mv=epaymentService.epaymentList(listData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName("GroupWare/epayment/epaymentDetermine");
		
		return mv;
		
	}
	
	//return 반려함
	@RequestMapping(value="epaymentReturn")
	public ModelAndView epaymentReturn(ListData listData){
		ModelAndView mv=null;
		listData.setResult("반려");
		
		try {
			mv=epaymentService.epaymentList(listData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName("GroupWare/epayment/epaymentReturn");
		
		return mv;
		
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
}
