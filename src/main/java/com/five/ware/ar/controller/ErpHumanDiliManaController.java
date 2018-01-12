package com.five.ware.ar.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.human.dili.DiliDTO;
import com.five.ware.erp.human.dili.DiliService;
import com.five.ware.erp.human.dili.MemberWorkDTO;
import com.five.ware.erp.human.dili.MemberWorkService;
import com.five.ware.erp.human.member.MemberDTO;
import com.five.ware.erp.human.member.MemberService;


@Controller
@RequestMapping(value="human/diliMana/**")
public class ErpHumanDiliManaController {
	
	@Inject
	DiliService diliService;
	@Inject
	MemberWorkService memberWorkService;

	
	@RequestMapping(value="diliSearch")
	public ModelAndView eb_diliList(String search) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		memberWorkService.mWorkList(search, mv);
		
		mv.setViewName("human/diliMana/diliSearch");
		
		return mv;
	}
	
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
	public ModelAndView diliInput(String search, @RequestParam(defaultValue="2018-01-01", required=false) String startdate, @RequestParam(defaultValue="2018-12-31", required=false)String enddate) throws Exception{
		List<String> ar = memberWorkService.diliNameList();
		List<MemberWorkDTO> ar2 = memberWorkService.memberWorkList(search, startdate, enddate);
		
		ModelAndView mv = new ModelAndView();
		
		if(search==null){
			search="";
		}
		
		mv.addObject("diliNameList", ar);
		mv.addObject("memberWorkList", ar2);
		mv.addObject("startdate", startdate);
		mv.addObject("enddate", enddate);
		mv.addObject("search", search);
		mv.setViewName("human/diliMana/diliInput");
		
		return mv;
	}
	
	@RequestMapping(value="diliNameList")
	@ResponseBody
	public List<String> diliNameList() throws Exception{
		List<String> ar = memberWorkService.diliNameList();
		
		return ar;
	}
	
	@RequestMapping(value="memList")
	@ResponseBody
	public List<Object> memList() throws Exception{
		List<MemberDTO> ar = memberWorkService.memList();
		List<String> ar2= memberWorkService.tempList();
		
		List<Object> arar= new ArrayList<Object>();
		
		arar.add(ar);
		arar.add(ar2);
		
		return arar;
	}
	
	@RequestMapping(value="memdiliInsert",method=RequestMethod.POST)
	public ModelAndView memdiliInsert(MemberWorkDTO memberWorkDTO, String [] code, String [] name, String [] temp, String [] other) throws Exception{
		int result=0;
		System.out.println("들어오니");
		System.out.println(memberWorkDTO.getWorkname());
		System.out.println(code.length);
		
		for(int i=0; i<code.length; i++){
			memberWorkDTO.setCode(code[i]);
			memberWorkDTO.setName(name[i]);
			memberWorkDTO.setTemp(temp[i]);
			memberWorkDTO.setOther(other[i]);
			
			result =memberWorkService.memdiliInsert(memberWorkDTO);
		}
		String message="등록 실패 ";
		
		if(result>0){
			message="등록되었습니다";
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("message", message);
		mv.addObject("addr", "diliInput");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@RequestMapping(value="workCode")
	@ResponseBody
	public String workCodeSearch(String workname) throws Exception{
		String workcode=memberWorkService.workCodeSearch(workname);
		
		return workcode;
	}
	
	@RequestMapping(value="memberWorkUpdate")
	@ResponseBody
	public List<Object> mworkOne(int num) throws Exception{
		MemberWorkDTO memberWorkDTO = memberWorkService.mworkOne(num);
		List<String> dilNameList = memberWorkService.diliNameList();
		
		List<Object> ar = new ArrayList<Object>();
		
		ar.add(memberWorkDTO);
		ar.add(dilNameList);
		
		return ar;
	}
	
	@RequestMapping(value="memdiliUpdate", method=RequestMethod.POST)
	public ModelAndView mworkUpdate(MemberWorkDTO memberWorkDTO) throws Exception{
		int result = memberWorkService.mworkUpdate(memberWorkDTO);
		
		String message= "수정 실패";
		
		if(result>0){
			message="수정되었습니다.";
		}
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("message", message);
		mv.addObject("addr", "diliInput");
		mv.setViewName("common/result");
		 
		return mv;
	}
	
	@RequestMapping(value="memdiliDelete", method=RequestMethod.POST)
	@ResponseBody
	public int mworkDelete(int num) throws Exception{
		int result = memberWorkService.mworkDelete(num);
		
		return result;
	}
	
}
