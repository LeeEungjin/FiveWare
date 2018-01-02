package com.five.ware.ar.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.human.basis.PositionDTO;
import com.five.ware.erp.human.basis.PositionService;

@Controller
@RequestMapping(value="human/basisInfo/**")
public class ErpHumanBasisInfoController {
	
	@Inject
	PositionService positionService;
	
	@RequestMapping(value="positionPlus", method=RequestMethod.GET)
	public ModelAndView positionPlus(ModelAndView mv) throws Exception{ 
		mv.addObject("positionList", positionService.positionList());
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
		
		System.out.println(result);
		
		model.addAttribute("message", message);
		model.addAttribute("addr", "positionPlus");
		
		return "common/result";		
	}
	
	@RequestMapping(value="positionUpdate", method=RequestMethod.GET)
	@ResponseBody
	public PositionDTO positionOne(String code) throws Exception{
		System.out.println(code);
		PositionDTO positionOne = positionService.positionOne(code);
		System.out.println(positionOne.getCode());
		return positionOne;
	}
	
	@RequestMapping(value="positionUpdate", method=RequestMethod.POST)
	public String positionUpdate(PositionDTO positionDTO, ModelAndView mv) throws Exception{
		System.out.println(positionDTO.getCode());
		System.out.println(positionDTO.getRank());
		System.out.println(positionDTO.getRanking());
		System.out.println(positionDTO.getUse());
		
		int result = positionService.positionUpdate(positionDTO);
		
		String message = "수정 실패";
		
		if(result>0){
			message="수정되었습니다.";
		}
		
		mv.addObject("message", message);
		mv.setViewName("human/basisInfo/positionPlus");
		
		return "common/result";
	}
	
	@RequestMapping(value="salPlus")
	public void salPluse(){	}
	
	

}
