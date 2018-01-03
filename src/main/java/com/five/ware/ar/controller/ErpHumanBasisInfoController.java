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

@Controller
@RequestMapping(value="human/basisInfo/**")
public class ErpHumanBasisInfoController {
	
	@Inject
	PositionService positionService;
	
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
		System.out.println(positionDTO.getCode());
		System.out.println(positionDTO.getRank());
		System.out.println(positionDTO.getRanking());
		System.out.println(positionDTO.getUse());
		
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
		System.out.println("들어오니");
		
		String ar[] = code.split(",");
		
		for(String cod : ar){
			System.out.println(cod);
			
			int result = positionService.positionDelete(cod);
			
			String message = "삭제 실패";
			
			if(result>0){
				message="삭제되었습니다.";
			}
			
		}
		
		/*model.addAttribute("message", message);
		model.addAttribute("addr", "positionPlus");*/
		
		/*return "common/result.jsp?message=delete&addr=positionPlus";*/
		
		return "redirect:./human/basisInfo/positionPlus";
		
	}
	
	@RequestMapping(value="salPlus")
	public void salPluse(){	}
	
	

}
