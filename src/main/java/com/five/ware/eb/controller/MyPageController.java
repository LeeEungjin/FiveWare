package com.five.ware.eb.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.test.web.ModelAndViewAssert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.erp.human.member.MemberDTO;
import com.five.ware.erp.human.member.MemberService;
import com.five.ware.erp.storeRegist.StoreRegistDTO;
import com.five.ware.erp.storeRegist.StoreRegistService;
import com.five.ware.time.TimeDTO;
import com.five.ware.time.TimeService;
import com.google.gson.JsonObject;

@Controller
@RequestMapping(value="/myPage/**")
public class MyPageController {
	
	@Inject
	private MemberService memberService;
	@Inject
	private StoreRegistService storeRegistService;
	@Inject
	private TimeService timeService;
	
	
	
	//출퇴근 기록
	@RequestMapping(value="timeRecord" ,method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView timeRecord(String memberCode){
		
		ModelAndView mv=new ModelAndView();
		
		Calendar ca = Calendar.getInstance();
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = sd.format(ca.getTime());
	
			try {
			mv=timeService.selectOneList(memberCode);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		mv.addObject("sysdate", sysdate);
		mv.setViewName("/GroupWare/myPage/timeRecord");
		
		
		return mv;
	}
	
	//update
	@RequestMapping(value="storeUpdate" ,method=RequestMethod.POST)
	public String storeMyPageUpdate(RedirectAttributes rd,StoreRegistDTO storeRegistDTO, HttpSession session){
		
		
		
		int result=0;
		try {
			result=storeRegistService.myPageUpdate(storeRegistDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String message="fail";
		if(result>0){
			message="success";
			try {
				storeRegistDTO = storeRegistService.selectOne(storeRegistDTO.getCode());
				session.setAttribute("member", storeRegistDTO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./storeMyPage";
	}
	
	
	
	//myPage
		@RequestMapping(value="storeMyPage")
		public String storeMyPage(HttpSession session)throws Exception{
			
			
			return  "/GroupWare/myPage/storeMyPage";
		}
	

		//update
		@RequestMapping(value="memberUpdate" ,method=RequestMethod.POST)
		public String memberMyPageUpdate(RedirectAttributes rd,MemberDTO memberDTO, HttpSession session){
			
			int result=0;
			try {
				result=memberService.myPageUpdate(memberDTO);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			String message="fail";
			if(result>0){
				message="success";
				try {
					memberDTO = memberService.memberOne(memberDTO.getCode());
					session.setAttribute("member", memberDTO);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			
			rd.addFlashAttribute("message", message);
			
			return "redirect:./memberMyPage";
		}
		
		
		//myPage
		@RequestMapping(value="memberMyPage")
		public String memberMyPage(HttpSession session)throws Exception{
			
			
			return  "/GroupWare/myPage/memberMyPage";
		}
		

}
