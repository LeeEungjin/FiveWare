package com.five.ware.eb.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.srm.staff.StaffDTO;
import com.five.ware.srm.staff.StaffService;
import com.five.ware.util.ListData;

@Controller
@RequestMapping(value="/srm/**")
public class SrmController {
	
	
	
	@Inject
	private StaffService staffService;
	
	
	//출퇴근조회
	@RequestMapping(value="staffTime")
	public ModelAndView staffTime(String store){
		ModelAndView mv=new ModelAndView();
		try {
			mv=staffService.staffTimeList(store);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("/srm/store/staffTime");
		return mv;
	}
	
	//storeNotice
	@RequestMapping(value="storeNotice")
	public String storeNotice(){
		return "srm/store/storeNotice";
	}
	
	
	
	//delete
	@RequestMapping(value="staffDelete", method=RequestMethod.GET)
	@ResponseBody
	public String delete(String num)throws Exception{
		int result=staffService.delete(num);
		
		String message="fail";
		if(result>0){
			message="success";
		}
		
		return message;
	}
	
	
	
	@RequestMapping(value="staffUpdate",method=RequestMethod.POST)
	public String update(StaffDTO staffDTO, RedirectAttributes rd){
		int result=0;
		try {
			result = staffService.update(staffDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String message="fail";
		if(result>0){
			message="success";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./staff";
		
	}
	
	@RequestMapping(value="staffView" ,method=RequestMethod.GET)
	@ResponseBody
	public StaffDTO selectOne(String num) throws Exception{
		
		StaffDTO staffDTO=staffService.selectOne(num);
		
		return staffDTO;
	}
	
	
	
	@RequestMapping(value="staffInsert", method=RequestMethod.POST)
	public String insert(StaffDTO staffDTO, RedirectAttributes rd){
		
		
		int result=0;
		try {
			result = staffService.insert(staffDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String message="fail";
		if(result>0){
			message="success";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./staff";
		
	}
	
	@RequestMapping(value="staff")
	public ModelAndView List(ListData listData){
	ModelAndView mv=null;
	try {
		mv=staffService.selectList(listData);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	mv.setViewName("/srm/store/staff");
	
		return mv;
	}

}
