package com.five.ware.jh.controller;

import java.net.URLEncoder;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.postIT.PostITDTO;
import com.five.ware.postIT.PostITService;

@Controller
@RequestMapping(value="**/srm/postIT/**")
public class PostITController {
	
	@Inject
	private PostITService postITService;
	
	@RequestMapping(value="postInsert" ,method=RequestMethod.POST)
	public String postInsert(PostITDTO postITDTO, RedirectAttributes rd)throws Exception{
		int result=0;
		String message="등록 실패";
		
		result=postITService.postInsert(postITDTO);
		
		if(result>0){
			message="등록 성공";
		}
		
		rd.addFlashAttribute("message", message);
		
		String store=URLEncoder.encode(postITDTO.getStore(), "UTF-8");

		String path="redirect:../../srm/pos/pos?store="+store;
		
		return path;
	}
	
	@RequestMapping(value="postDelete")
	public String postDelete(String store, int num, RedirectAttributes rd)throws Exception{
		
		postITService.postDelete(num);
		
		store=URLEncoder.encode(store, "UTF-8");

		String path="redirect:../../srm/pos/pos?store="+store;
		
		
		return path;
	}
	
	@RequestMapping(value="postView")
	public ModelAndView postView(int num)throws Exception{
		ModelAndView mv=new ModelAndView();
		PostITDTO postITDTO=new PostITDTO();
		
		postITDTO=postITService.postView(num);
		
		mv.addObject("view", postITDTO);
		mv.setViewName("srm/pos/postView");
		
		return mv;
	}
	
}
