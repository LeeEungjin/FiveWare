package com.five.ware;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.community.BlackListDTO;
import com.five.ware.community.BlackListService;
import com.five.ware.community.CommunityDTO;
import com.five.ware.community.CommunityService;
import com.five.ware.util.ListData;

import oracle.net.aso.b;

@Controller
@RequestMapping(value="/community/*")
public class ERPCoummunityController {
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private BlackListService blackListService;
	
	//selecctList
	@RequestMapping(value="communityList")
	public ModelAndView selectList(ListData listData, String temp)throws Exception{
		ModelAndView modelAndView=null;
		
		modelAndView=communityService.selectList(listData, temp);
		
		return modelAndView;
	}
	
	//selectOne
	@RequestMapping(value="communityOne")
	public String selectOne(Model model, int num)throws Exception{

		Map<String, Object> map=communityService.selectOne(num);
		
		model.addAttribute("view", map.get("communityDTO"));
		model.addAttribute("community", "ERP");
		model.addAttribute("report", communityService.reportCount(num));
		
		return "community/communityView";
	}
	
	//insert->form
	@RequestMapping(value="communityWrite", method={RequestMethod.GET})
	public String insert(Model model)throws Exception{
		model.addAttribute("community", "ERP");
		
		return "community/communityWrite";
	}
	
	//insert->DB
	@RequestMapping(value="communityWrite", method={RequestMethod.POST})
	public String insert(RedirectAttributes rd, CommunityDTO communityDTO, BlackListDTO blackListDTO, HttpSession session)throws Exception{
		int result=0;
		
		blackListDTO.setNames(communityDTO.getWriter());
		
		result=communityService.insert(communityDTO, blackListDTO, session);
		
		String message="공지사항 등록을 실패했습니다.";
		
		if(result>0){
			message="공지사항 등록을 성공했습니다.";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./communityList";
	}
	
	//update->form
	@RequestMapping(value="communityUpdate", method={RequestMethod.GET})
	public String update(int num, Model model)throws Exception{
		Map<String, Object> map=communityService.selectOne(num);

		model.addAttribute("update", map.get("communityDTO"));
		model.addAttribute("fileCount", map.get("fileCount"));
		model.addAttribute("community", "ERP");
		
		return "community/communityUpdate";
	}
	
	//update->DB
	@RequestMapping(value="communityUpdate", method={RequestMethod.POST})
	public String update(CommunityDTO communityDTO, HttpSession session,RedirectAttributes rd)throws Exception{
		String message="공지사항 수정을 실패했습니다.";
		int result=communityService.update(communityDTO,session);
		
		if(result>0){
			message="공지사항 수정을 성공했습니다.";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./communityList";
	}
	
	@RequestMapping(value="fileDelete")
	public int filedelete(int fnum, RedirectAttributes rd)throws Exception{
		String message="파일 삭제를 실패했습니다.";
		
		int result=communityService.fileDelete(fnum);
		
		if(result>0){
			message="파일 삭제를 성공했습니다.";
		}
		
		rd.addFlashAttribute("message", message);
		
		return result;
	}
	
	@RequestMapping(value="communityDelete")
	public String delete(int num, RedirectAttributes rd)throws Exception{
		String message="공지사항 삭제를 실패했습니다.";
		
		int result=communityService.delete(num);
		
		if(result>0){
			message="공지사항 삭제를 성공했습니다.";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./communityList";
	}

}
