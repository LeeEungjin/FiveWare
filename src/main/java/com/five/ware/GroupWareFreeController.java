package com.five.ware;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.community.FreeDTO;
import com.five.ware.community.FreeService;
import com.five.ware.util.ListData;

@Controller
@RequestMapping(value="/free/*")
public class GroupWareFreeController {
	
	@Autowired
	private FreeService freeService;
	
	//list
	@RequestMapping(value="freeList")
	public ModelAndView selectList(ListData listData, String target)throws Exception{
		ModelAndView mv=null;
		
		mv=freeService.selectList(listData, target);
		
		return mv;
	}
	
	//view
	@RequestMapping(value="freeView")
	public String selectOne(Model model, int num)throws Exception{
		
		model.addAttribute("view", freeService.selectOne(num));
		
		return "free/freeView";
	}
	
	//insert->form
	@RequestMapping(value="freeWrite", method={RequestMethod.GET})
	public String insert()throws Exception{
		
		return "free/freeWrite";
	}
	
	//insert->database
	@RequestMapping(value="freeWrite", method={RequestMethod.POST})
	public String insert(RedirectAttributes rd, FreeDTO freeDTO, HttpSession session)throws Exception{
		int result=0;
		String message="글쓰기 실패";
		
		result=freeService.freeInsert(freeDTO, session);
		
		if(result>0){
			message="글쓰기 성공";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./freeList";
	}
	
	//reply->form
	@RequestMapping(value="freeReply", method={RequestMethod.GET})
	public String reply(Model model, int num)throws Exception{
		
		model.addAttribute("reply", freeService.selectOne(num));
		
		return "free/freeReply";
	}
	
	//reply->database
	@RequestMapping(value="freeReply", method={RequestMethod.POST})
	public String reply(RedirectAttributes rd, FreeDTO freeDTO, HttpSession session)throws Exception{
		int result=0;
		String message="답글 실패";
		
		result=freeService.freeReply(freeDTO, session);
		
		if(result>0){
			message="답글 성공";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./freeList";
	}
	
	//update->form
	@RequestMapping(value="freeUpdate", method={RequestMethod.GET})
	public String update(Model model, int num)throws Exception{
		FreeDTO freeDTO=freeService.selectOne(num);
		
		model.addAttribute("update", freeDTO);
		
		return "free/freeUpdate";
	}
	
	//update->database
	@RequestMapping(value="freeUpdate", method={RequestMethod.POST})
	public String update(RedirectAttributes rd, FreeDTO freeDTO, HttpSession session)throws Exception{
		int result=0;
		String message="수정 실패";
		
		result=freeService.update(freeDTO, session);
		
		if(result>0){
			message="수정 성공";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./freeList";
	}
	
	//delete
	@RequestMapping(value="freeDelete")
	public String delete(int num, RedirectAttributes rd)throws Exception{
		int result=0;
		String message="삭제 실패";
		
		result=freeService.delete(num);
		
		if(result>0){
			message="삭제 성공";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./freeList";
	}
	
	//fileDelete
	@RequestMapping(value="fileDelete")
	@ResponseBody
	public String fileDelete(int fnum)throws Exception{
		String message="파일 삭제 실패";
		int result=0;
		
		result=freeService.fileDelete(fnum);
		
		if(result>0){
			message="해당 파일을 삭제하였습니다.";
		}
		
		
		return message;
	}
}
