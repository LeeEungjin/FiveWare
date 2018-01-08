package com.five.ware.jh.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.mater.MaterDTO;
import com.five.ware.mater.MaterOrderDTO;
import com.five.ware.mater.MaterService;

@Controller
@RequestMapping(value="erp/mater/**")
public class MaterController {
	
	@Autowired
	private MaterService materService;
	
	@RequestMapping(value="materRegist")
	public ModelAndView materRegist(ModelAndView mv, String materKind){
		
		try {
			mv.addObject(materKind+"List", materService.selectList(materKind));
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("erp/mater/"+materKind+"Regist");

		return mv;
	}
	
	@RequestMapping(value="materDateList")
	public ModelAndView materDateSerach(ModelAndView mv, String materKind, String smaterDate, String ematerDate){

		try {
			mv.addObject("dateList", materService.materDateList(materKind, smaterDate, ematerDate));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName("erp/mater/materDateList");
		
		return mv;
	}
	
	@RequestMapping(value="materOrder")
	public ModelAndView materOrder(){
		ModelAndView mv=new ModelAndView();
/*		List<MaterOrderDTO> ar=null;
*/		
		try {
			mv.addObject("ar", materService.materOrder());
			/*ar=materService.materOrder();
			System.out.println("?"+ar.size());*/
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName("erp/mater/materOrder");
		
		return mv;
	}
	
	@RequestMapping(value="materSupList")
	@ResponseBody
	public List<String> materSupList(){
		List<String> ar=null;
		
		try {
			ar=materService.materSupList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ar;
	}
	
	@RequestMapping(value="materStorageList")
	@ResponseBody
	public List<String> materStorageList(){
		List<String> ar=null;
		
		try {
			ar=materService.materStorageList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ar;
	}
	
	@RequestMapping(value="materWrite", method=RequestMethod.POST)
	public String materRegist(MaterDTO materDTO, RedirectAttributes rd){
		int result=0;
		String message="Fail";
		
		try {
			result=materService.insert(materDTO);
			if(result>0){
				message="Success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		rd.addFlashAttribute("message", message);
		
		return "redirect:./materRegist?materKind="+materDTO.getMaterKind();
	}
	
	@RequestMapping(value="materView", method=RequestMethod.GET)
	@ResponseBody
	public MaterDTO selectOne(Model model, String materCode){
		MaterDTO materDTO=null;
		
		try {
			materDTO = materService.selectOne(materCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return materDTO;
	}
	
	@RequestMapping(value="materUpdate", method=RequestMethod.POST)
	public String update(MaterDTO materDTO, RedirectAttributes rd){
		String message="Fail";
		int result=0;
		
		try {
			result=materService.update(materDTO);
			
			if(result>0){
				message="Success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./materRegist";
	}
	
	
	@RequestMapping(value="materDelete")
	public String delete(String materCode, RedirectAttributes rd){
		String message="Fail";
		int result=0;
		
		try {
			result=materService.delete(materCode);
			
			if(result>0){
				message="Success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./materRegist";
	}
	
}
