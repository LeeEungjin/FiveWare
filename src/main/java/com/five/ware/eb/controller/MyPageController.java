package com.five.ware.eb.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.test.web.ModelAndViewAssert;
import org.springframework.validation.BindingResult;
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
	
	
	
	
	//비밀번호 변경
	@RequestMapping(value="memberPwUpdate",method=RequestMethod.POST)
	public String memberPwUpdate(String code,String pw,RedirectAttributes rd,String kind){
	
		int result=0;
		try {
			if(kind.equals("member")){
				result = memberService.pwUpdate(code,pw);
			}else{
				result=storeRegistService.pwUpdate(code, pw);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String message="fail";
		if(result>0){
			message="success";
		}
		
		rd.addFlashAttribute("message", message);
		return "redirect:./myPageMain";
	}
	
	//member pw
		@RequestMapping(value="memberPwCheck",method=RequestMethod.GET)
		@ResponseBody
		public boolean memberPw(String code,String pw,String kind)throws Exception{
			boolean check=false;

			if(kind.equals("member")){
			String dbpw=memberService.pwCheck(code);

			
			if(dbpw.equals(pw)){
				check=true;
			}
			
			}else{
				String dbpw=storeRegistService.pwCheck(code);
				if(dbpw.equals(pw)){
					check=true;
				}
			}
			
			return check;
		}
	
		//member pw
		@RequestMapping(value="memberPw")
		public String memberPw()throws Exception{
			return "/GroupWare/myPage/memberPw";
		}
		
	
	//main
	@RequestMapping(value="myPageMain")
	public String myPageMain()throws Exception{
		
		return "/GroupWare/myPage/myPageMain";
	}
	
	
	//출퇴근 기록
	@RequestMapping(value="timeRecord" ,method=RequestMethod.GET)
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
