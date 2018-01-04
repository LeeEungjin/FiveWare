package com.five.ware.ar.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.HttpSessionMutexListener;

import com.five.ware.erp.human.member.MemberService;

@Controller
@RequestMapping(value="/human/memberMana/**")
public class ErpHumanMemberManaController {

	@Inject
	MemberService memberService;
	
	@RequestMapping(value="memberPlus")
	public void memberPlus() throws Exception{
		
	}
	
	@RequestMapping(value="fileAjax", method=RequestMethod.POST)
	public void fileAjax(MultipartHttpServletRequest file, HttpSession session) throws Exception{
		System.out.println("성공");
		System.out.println(file.getFileNames());
		//System.out.println(file.getOriginalFilename());
	}
}
