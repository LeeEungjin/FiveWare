package com.five.ware.jh.controller;

import java.net.URLEncoder;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		
		System.out.println(path);
		
		return path;
	}
	
}
