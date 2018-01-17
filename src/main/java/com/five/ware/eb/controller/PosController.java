package com.five.ware.eb.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.srm.staff.StaffDTO;
import com.five.ware.srm.staff.StaffService;
import com.five.ware.srm.staff.StaffTimeDTO;

@Controller
@RequestMapping(value="/srm/**")
public class PosController {

	@Inject
	StaffService staffService;
	
	
	//퇴근
	@RequestMapping(value="staffTimeUpdate",method=RequestMethod.POST)
	@ResponseBody
	public String staffTimeUpdate(StaffTimeDTO staffTimeDTO)throws Exception{
		int result=staffService.staffTimeUpdate(staffTimeDTO);
		
		String message="fail";
		if(result>0){
			message="success";
		}
		return message;
	}
	
	//출퇴근
	@RequestMapping(value="staffTime",method=RequestMethod.POST)
	@ResponseBody
	public String staffTimeRecord(StaffTimeDTO staffTimeDTO)throws Exception{
	
		int result=staffService.staffTime(staffTimeDTO);
		
		String message="fail";
		if(result>0){
			message="success";
		}
		
		return message;
	}
	
	
	@RequestMapping(value="pos")
	public ModelAndView pos(){
	
		ModelAndView mv=new ModelAndView();
		
		Calendar ca = Calendar.getInstance();
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy년 MM월 dd일 ");



		
		String sysdate = sd.format(ca.getTime());
		
		
		mv.addObject("sysdate", sysdate);
		
		
		
		
		return mv;
	}
	
	@RequestMapping(value="staffList")
	@ResponseBody
	public ModelAndView staffList(String store){
		
		
		ModelAndView mv=null;
		try {
			mv=staffService.posStaffList(store);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName("/srm/pos/staffList");
		
		return mv;
		
	}
}
