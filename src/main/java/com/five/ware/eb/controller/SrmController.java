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
import com.five.ware.srm.storeNotice.StoreNoticeDTO;
import com.five.ware.srm.storeNotice.StoreNoticeService;
import com.five.ware.util.ListData;

@Controller
@RequestMapping(value="/srm/**")
public class SrmController {
	
	
	
	@Inject
	private StaffService staffService;
	
	@Inject
	private StoreNoticeService storeNoticeService;
	
	
	@RequestMapping(value="storeNoticeReplyView",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView replyView(int num)throws Exception{
		
		ModelAndView mv=new ModelAndView();
		mv=storeNoticeService.replyList(num);
		
		mv.setViewName("/srm/store/storeNoticeReply");
		
		return mv;
		
	}
	
	
	//리플
	@RequestMapping(value="storeReply",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView reply(StoreNoticeDTO storeNoticeDTO)throws Exception{
		System.out.println("Aa");
		ModelAndView mv=new ModelAndView();
		storeNoticeDTO.setKind("답글");
		int result=storeNoticeService.insert(storeNoticeDTO);	
		
		mv.setViewName("/srm/store/storeNoticeReply");
		
		return mv;
	}
	
	

	
	//게시판insert
	@RequestMapping(value="storeNoticeWrite",method=RequestMethod.POST)
	public String noticeInsert(StoreNoticeDTO storeNoticeDTO,RedirectAttributes rd)throws Exception{
		storeNoticeDTO.setKind("원글");
		int result=storeNoticeService.insert(storeNoticeDTO);
		
		String message="fail";
		if(result>0){
			message="success";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./storeNotice";
	}
	
	//update
	@RequestMapping(value="storeNoticeUpdate",method=RequestMethod.POST)
	public String noticeUpdate(StoreNoticeDTO storeNoticeDTO,RedirectAttributes rd){
		
		int result=0;
		try {
			result = storeNoticeService.update(storeNoticeDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String message="fail";
		if(result>0){
			message="success";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./storeNotice";
	}
	
	//update form
	@RequestMapping(value="storeNoticeUpdate",method=RequestMethod.GET)
	public ModelAndView noticeUpdate(int num)throws Exception{
		
		ModelAndView mv=new ModelAndView();
		
		StoreNoticeDTO storeNoticeDTO=storeNoticeService.selectOne(num);
		
		mv.addObject("view", storeNoticeDTO);
		mv.setViewName("/srm/store/storeNoticeUpdate");
		
		return mv;
	}
	
	//delete
	@RequestMapping(value="storeNoticeDelete")
	public String noticeDelete(int num,RedirectAttributes rd)throws Exception{
		int result=storeNoticeService.delete(num);
		
		String message="fail";
		if(result>0){
			message="success";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./storeNotice";
	}
	
	
	//게시판 view
	@RequestMapping(value="storeNoticeView")
	public ModelAndView noticeView(int num)throws Exception{
		
		ModelAndView mv=new ModelAndView();
		
		StoreNoticeDTO storeNoticeDTO=storeNoticeService.selectOne(num);
		
		mv.addObject("view", storeNoticeDTO);
		mv.setViewName("/srm/store/storeNoticeView");
		
		return mv;
	}
	
	
	//자유 게시판
	@RequestMapping(value="storeNoticeWrite" ,method=RequestMethod.GET)
	public String noticeWrite(){
	
		
		return "/srm/store/storeNoticeWrite";
	}
	
	//storeNotice
	@RequestMapping(value="storeNotice")
	public ModelAndView storeNotice(ListData listData){
	ModelAndView mv=new ModelAndView();
		
		try {
			mv=storeNoticeService.selectList(listData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName("/srm/store/storeNotice");
		return mv;
	}
	
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
	public ModelAndView List(ListData listData,String store){
		System.out.println(store);
	ModelAndView mv=null;
	try {
		mv=staffService.selectList(listData,store);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	mv.setViewName("/srm/store/staff");
	
		return mv;
	}

}
