package com.five.ware.ar.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.runner.Request;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.HttpSessionMutexListener;
import com.five.ware.erp.human.member.MemberDTO;
import com.five.ware.erp.human.member.MemberService;

@Controller
@RequestMapping(value="human/memberMana/**")
public class ErpHumanMemberManaController {

	@Inject
	MemberService memberService;
	
	@RequestMapping(value="memberPlus")
	public void memberPlus() throws Exception{
		
	}
	
	@RequestMapping("ajax")
	@ResponseBody
	   public String ajaxUp(MultipartFile f, HttpSession session){
	      System.out.println("in");
	      System.out.println(f.getOriginalFilename());
	      
	      String filePath=session.getServletContext().getRealPath("resources/member");
	    
	      return "";
	   }
	
	@RequestMapping(value="memberInsertact", method=RequestMethod.POST)
	public String memberInsert(Model model, MemberDTO memberDTO) throws Exception{
		System.out.println("내말 들리니");
		
		int result = memberService.memberInsert(memberDTO);
		
		String message="등록 실패";
		
		if(result > 0){
			message="등록되었습니다.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("addr", "./memberPlus");
		
		return "common/result";
	}
	
	@RequestMapping(value="rankList")
	@ResponseBody
	public List<String> rankList() throws Exception{
		System.out.println("들어왔니");
		
		List<String> rank = memberService.rankList();
		
		for(String ar : rank){
			System.out.println(ar);
		}
		
		
		return rank ;
	}
}
