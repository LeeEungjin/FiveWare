package com.five.ware.ar.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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
import com.five.ware.file.FileDTO;
import com.five.ware.file.FileService;

@Controller
@RequestMapping(value="human/memberMana/**")
public class ErpHumanMemberManaController {

	@Inject
	MemberService memberService;
	@Inject
	FileService fileService;
	
	@RequestMapping(value="memberPlus", method=RequestMethod.GET)
	public ModelAndView memberPlus(String search) throws Exception{
		List<MemberDTO> ar = memberService.memberList(search);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("memberList", ar);
		mv.setViewName("human/memberMana/memberPlus");
		
		return mv;
	}
	
	@RequestMapping("file/ajax")
	@ResponseBody
	   public String ajaxUp(MultipartFile f, HttpSession session) throws Exception {
	      String filePath=session.getServletContext().getRealPath("resources/member");
	      
	      File file = new File(filePath);
	      
	      if(!file.exists()){
	    	  file.mkdirs();
	      }
	      
	     String fileName=f.getOriginalFilename();
	     fileName=fileName.substring(fileName.lastIndexOf("."));
	     
	     String name=UUID.randomUUID().toString();
	     fileName=name+fileName;
	     
	     file = new File(filePath, fileName);
	     System.out.println(filePath);
	 
	     f.transferTo(file);
	     
	   
	     
	     return fileName;
	   }
	
	@RequestMapping("file/ajax2")
	@ResponseBody
	   public String ajaxUp2(MultipartFile f2, HttpSession session) throws Exception {
	      String filePath=session.getServletContext().getRealPath("resources/member");
	      
	      File file = new File(filePath);
	      
	      if(!file.exists()){
	    	  file.mkdirs();
	      }
	      
	     String fileName=f2.getOriginalFilename();
	     fileName=fileName.substring(fileName.lastIndexOf("."));
	     
	     String name=UUID.randomUUID().toString();
	     fileName=name+fileName;
	     
	     file = new File(filePath, fileName);
	     System.out.println(filePath);
	 
	     f2.transferTo(file);
	     
	   
	     
	     return fileName;
	   }
	
	@RequestMapping(value="memberInsertact", method=RequestMethod.POST)
	public String memberInsert(Model model, MemberDTO memberDTO, FileDTO fileDTO) throws Exception{
		System.out.println(memberDTO.getName());
		int result = memberService.memberInsert(memberDTO);
		
		String message="등록 실패";
		
		if(result > 0){
			int result2 = fileService.fileInsert(fileDTO);
			
			if(result2>0){
				message="등록되었습니다.";
			}
		}
		
		model.addAttribute("message", message);
		model.addAttribute("addr", "./memberPlus");
		
		return "common/result";
	}
	
	@RequestMapping(value="rankList")
	@ResponseBody
	public List<String> rankList() throws Exception{
		List<String> rank = memberService.rankList();
		
		return rank ;
	}
	
	@RequestMapping(value="memberUpdate", method=RequestMethod.GET)
	@ResponseBody
	public List<Object> memberOne(String code) throws Exception{
		MemberDTO memberDTO = memberService.memberOne(code);
		FileDTO fileDTO = fileService.fileOne(code);
		List<String> rank = memberService.rankList();
		
		List<Object> ar = new ArrayList<Object>();
		
		ar.add(memberDTO);
		ar.add(fileDTO);
		ar.add(rank);
		
		return ar;
	}
	
	@RequestMapping(value="memberUpdate", method=RequestMethod.POST)
	public String memberUpdate(MemberDTO memberDTO, Model model) throws Exception{
		int result = memberService.memberUpdate(memberDTO);
		
		String message = "수정 실패";
		
		if(result>0){
			message="수정되었습니다.";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("addr", "memberPlus");
		
		return "common/result";
		
	}
	
	@RequestMapping(value="memberDelete", method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public int memberDelete(MemberDTO memberDTO) throws Exception{
		int result = memberService.memberDelete(memberDTO);
		
		return result;
	}
	
	@RequestMapping(value="retireeMana")
	public ModelAndView retireeMana(String search) throws Exception{
		List<MemberDTO> ar = memberService.retireeList(search);
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("retireeList", ar);
		mv.setViewName("human/memberMana/retireeMana");
		
		return mv;
	}
	
	@RequestMapping(value="retireeDelete")
	@ResponseBody
	public int retireeDelete(MemberDTO memberDTO) throws Exception{
		int result = memberService.retireeDelete(memberDTO);
		
		return result;
	}
	
}
