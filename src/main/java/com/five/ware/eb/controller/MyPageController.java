package com.five.ware.eb.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.erp.human.member.MemberDTO;
import com.five.ware.erp.human.member.MemberService;
import com.five.ware.erp.storeRegist.StoreRegistDTO;
import com.five.ware.erp.storeRegist.StoreRegistService;

@Controller
@RequestMapping(value="/myPage/**")
public class MyPageController {
	
	@Inject
	MemberService memberService;
	@Inject
	StoreRegistService storeRegistService;
	
	
	//출퇴근 기록
	@RequestMapping(value="timeRecord")
	public String timeRecord(){
		
		return "/GroupWare/myPage/timeRecord";
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
