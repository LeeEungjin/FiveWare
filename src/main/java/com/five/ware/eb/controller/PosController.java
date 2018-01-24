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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.erp.menuRegist.MenuRegistService;
import com.five.ware.postIT.PostITService;
import com.five.ware.srm.staff.StaffDTO;
import com.five.ware.srm.staff.StaffService;
import com.five.ware.srm.staff.StaffTimeDTO;
import com.five.ware.storeSales.StoreSalesDTO;
import com.five.ware.storeSales.StoreSalesService;

@Controller
@RequestMapping(value="/srm/**")
public class PosController {

	@Inject
	StaffService staffService;
	@Inject
	MenuRegistService menuRegistService;
	@Inject
	StoreSalesService storeSalesService;
	@Inject
	private PostITService postitService;
	
	
	
	//결제 내역 view
	@RequestMapping(value="ListView",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView ListView(int num)throws Exception{
		ModelAndView mv=new ModelAndView();
		mv=storeSalesService.selectOne(num);
		mv.setViewName("/srm/pos/storeSalesView");
		return mv;
		
	}
	
	
	//결제 내역 리스트
	@RequestMapping(value="storeSalesList",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView storeSalesList(StoreSalesDTO storeSalesDTO){
	
		ModelAndView mv=new ModelAndView();
		try {
			mv=storeSalesService.selectList(storeSalesDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("/srm/pos/storeSalesList");
		
		return mv;
		
	}
	
	//insert
	@RequestMapping(value="storeSales",method=RequestMethod.POST)
	public String storeSales(StoreSalesDTO storeSalesDTO,RedirectAttributes rd){
		int result=0;
		try {
			result=storeSalesService.insert(storeSalesDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String message="결제 실패";
		 if(result>0){
			 message="결제 성공";
		 }
		rd.addFlashAttribute("message", message);
		
		return "redirect:./pos";
		 
		
	}
	
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
	
	
	//pos
	@RequestMapping(value="pos")
	public ModelAndView pos(String menuKind, String store){
		ModelAndView mv=new ModelAndView();
		
		menuKind="coffee";
		
		
		Calendar ca = Calendar.getInstance();
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = sd.format(ca.getTime());
		
		try {
			mv=menuRegistService.posMenu(menuKind);
			mv.addObject("postList", postitService.postList(store));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.addObject("sysdate", sysdate);
		/*mv.setViewName("srm/pos/pos?store="+store);*/
		
		return mv;
	}
	
	
	//pos 메뉴
	@RequestMapping(value="posMenu",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView posMenu(String menuKind){
		
		ModelAndView mv=new ModelAndView();
		try {
			mv=menuRegistService.posMenu(menuKind);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName("/srm/pos/posDrink");
		
		return mv;
	}
	
	
	//직원 리스트
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
