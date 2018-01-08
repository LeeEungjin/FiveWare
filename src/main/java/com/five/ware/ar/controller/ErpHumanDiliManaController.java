package com.five.ware.ar.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.human.dili.DiliDTO;
import com.five.ware.erp.human.dili.DiliService;


@Controller
@RequestMapping(value="human/diliMana/**")
public class ErpHumanDiliManaController {
	
	@Inject
	DiliService diliService;

	@RequestMapping(value="diliPlus")
	public ModelAndView diliList(String search) throws Exception{
		List<DiliDTO> ar = diliService.diliList(search);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("diliList", ar);
		mv.setViewName("human/diliMana/diliPlus");
		
		return mv;
	}
	
	@RequestMapping(value="diliInsert", method=RequestMethod.POST)
	public ModelAndView diliInsert(DiliDTO diliDTO) throws Exception{
		int result = diliService.diliInsert(diliDTO);
		
		String message = "등록 실패";
		
		if(result>0){
			message="등록되었습니다.";
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("message", message);
		mv.addObject("addr", "diliPlus");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@RequestMapping(value="diliUpdate", method=RequestMethod.GET)
	@ResponseBody
	public DiliDTO diliOne(String code) throws Exception{
		DiliDTO diliDTO = diliService.diliOne(code);
		
		return diliDTO;
	}
	
	@RequestMapping(value="diliUpdate", method=RequestMethod.POST)
	public ModelAndView diliUpdate(DiliDTO diliDTO) throws Exception{
		int result = diliService.diliUpdate(diliDTO);
		
		String message="수정 실패";
		
		if(result>0){
			message="수정되었습니다.";
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("message", message);
		mv.addObject("addr", "diliPlus");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@RequestMapping(value="diliDelete", method=RequestMethod.POST)
	@ResponseBody
	public void diliDelete(String code) throws Exception{
		String ar[] = code.split(",");
		
		for(String cod : ar ){
			int result = diliService.diliDelete(cod);			
		}
		
	}
	
	@RequestMapping(value="diliInput")
	public void diliInput() throws Exception{
		
	}
}
