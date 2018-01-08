package com.five.ware.ar.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.test.web.ModelAndViewAssert;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.human.basis.PositionDTO;
import com.five.ware.erp.human.basis.PositionService;
import com.five.ware.erp.human.basis.SalDTO;
import com.five.ware.erp.human.basis.SalService;

@Controller
@RequestMapping(value="human/basisInfo/**")
public class ErpHumanBasisInfoController {
	
	@Inject
	PositionService positionService;
	@Inject
	SalService salService;
	
	@RequestMapping(value="positionPlus", method=RequestMethod.GET)
	public ModelAndView positionPlus(ModelAndView mv,String search) throws Exception{ 
		mv.addObject("positionList", positionService.positionList(search));
	    mv.setViewName("human/basisInfo/positionPlus");
		
		return mv;
		
	}
	
	@RequestMapping(value="positionPlus", method=RequestMethod.POST)
	public String positionPlus(PositionDTO positionDTO, Model model) throws Exception{ 
		int result = positionService.positionPlus(positionDTO);
		
		String message="등록 실패";
		
		if(result>0){
			message="등록되었습니다.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("addr", "positionPlus");
		
		return "common/result";		
	}
	
	@RequestMapping(value="positionUpdate", method=RequestMethod.GET)
	@ResponseBody
	public PositionDTO positionOne(String code) throws Exception{
		PositionDTO positionOne = positionService.positionOne(code);
		
		return positionOne;
	}
	
	@RequestMapping(value="positionUpdate", method=RequestMethod.POST)
	public String positionUpdate(PositionDTO positionDTO, Model model) throws Exception{
		int result = positionService.positionUpdate(positionDTO);
		
		String message = "수정 실패";
		
		if(result>0){
			message="수정되었습니다.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("addr", "positionPlus");
		
		return "common/result";		
	}
	
	@RequestMapping(value="positionDelete")
	@ResponseBody
	public String positionDelete(String code, Model model) throws Exception{
		String ar[] = code.split(",");
		
		for(String cod : ar){
			System.out.println(cod);
			
			int result = positionService.positionDelete(cod);
			
			String message = "삭제 실패";
			
			if(result>0){
				message="삭제되었습니다.";
			}
			
		}
		
		return "redirect:./human/basisInfo/positionPlus";
		
	}
	
	@RequestMapping(value="salPlus")
	public ModelAndView salPluse(String search, ModelAndView mv) throws Exception{	
		mv.addObject("salList", salService.salList(search));
		mv.setViewName("human/basisInfo/salPlus");
		
		return mv;
	}
	
	@RequestMapping(value="salInsert", method=RequestMethod.POST)
	public ModelAndView salInsert(SalDTO salDTO) throws Exception{
		int result = salService.salInsert(salDTO);
		
		String message = "등록 실패";
		
		if(result>0){
			message = "등록되었습니다.";
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("message", message);
		mv.addObject("addr", "salPlus");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@RequestMapping(value="salUpdate", method=RequestMethod.GET)
	@ResponseBody
	public SalDTO selOne(String code) throws Exception{
		SalDTO salDTO = salService.salOne(code);
		
		return salDTO;
	}
	
	@RequestMapping(value="salUpdate", method=RequestMethod.POST)
	public String salUpdte(SalDTO salDTO, Model model) throws Exception{
		int result = salService.salUpdate(salDTO);
		
		String message = "수정 실패";
		
		if(result>0){
			message="수정되었습니다.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("addr", "salPlus");
		
		return "common/result";
	}
	
	@RequestMapping(value="salDelete", method=RequestMethod.POST)
	@ResponseBody
	public void salDelete(String code) throws Exception{
		String ar[] = code.split(",");
		
		for(String cod : ar){
			int result = salService.salDelete(cod);
			
			}
		}
		
	}

