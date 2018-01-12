package com.five.ware;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.community.CommunityDTO;
import com.five.ware.community.CommunityService;
import com.five.ware.util.ListData;

@Controller
@RequestMapping(value="/community/*")
public class ERPCoummunityController {
	
	@Autowired
	private CommunityService communityService;
	
	//selecctList
	@RequestMapping(value="communityList")
	public ModelAndView selectList(ListData listData)throws Exception{
		ModelAndView modelAndView=null;
		modelAndView=communityService.selectList(listData);
		
		return modelAndView;
	}
	
	//selectOne
	@RequestMapping(value="communityOne")
	public String selectOne(Model model, int num)throws Exception{
		CommunityDTO communityDTO=communityService.selectOne(num);
		
		model.addAttribute("view", communityDTO);
		model.addAttribute("community", "ERP");
		
		return "community/communityView";
	}
	
	//insert->form
	@RequestMapping(value="communityWrite", method={RequestMethod.GET})
	public String insert(Model model)throws Exception{
		model.addAttribute("community", "ERP");
		
		return "community/communityWrtie";
	}
	
	//insert->DB
	@RequestMapping(value="communityWrite", method={RequestMethod.POST})
	public String insert(RedirectAttributes rd, CommunityDTO communityDTO, HttpSession session)throws Exception{
		int result=0;
		
		result=communityService.insert(communityDTO, session);
		
		String message="글쓰기 성공";
		
		if(result>0){
			message="글쓰기 실패;";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./communityList";
	}
	
	//update->form
	@RequestMapping(value="communityUpdate", method={RequestMethod.GET})
	public String update(int num, Model model)throws Exception{
		CommunityDTO communityDTO=communityService.selectOne(num);
		
		model.addAttribute("view", communityDTO);
		model.addAttribute("community", "ERP");
		
		return "community/communityUpdate";
	}
	
	//update->DB
	@RequestMapping(value="cimmunityUpdate", method={RequestMethod.POST})
	public String update(CommunityDTO communityDTO, RedirectAttributes rd)throws Exception{
		String message="수정 실패";
		int result=communityService.update(communityDTO);
			
		if(result>0){
			message="수정 성공";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./communityList";
	}

}
