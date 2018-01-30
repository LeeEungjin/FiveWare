package com.five.ware;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.List;
import java.util.Map;

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
import com.five.ware.erp.storeRegist.StoreRegistDTO;
import com.five.ware.util.ListData;

@Controller
@RequestMapping(value="/free/*")
public class GroupWareFreeController {
	
	@Autowired
	private FreeService freeService;
	
	@RequestMapping(value="storeList")
	@ResponseBody
	public List<String> storeList()throws Exception{
		List<String> storeList=freeService.storeList();
		
		return storeList;
	}
	
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
		Map<String, Object> map=freeService.selectOne(num);
		
		model.addAttribute("view", map.get("freeDTO"));
		
		return "free/freeView";
	}
	
	//insert->form
	@RequestMapping(value="freeWrite", method={RequestMethod.GET})
	public String insert(Model model)throws Exception{
		
		List<String> storeList=freeService.storeList();
		
		model.addAttribute("storeList", storeList);
		
		
		return "free/freeWrite";
	}
	
	//insert->database
	@RequestMapping(value="freeWrite", method={RequestMethod.POST})
	public String insert(RedirectAttributes rd, FreeDTO freeDTO, HttpSession session)throws Exception{
		int result=0;
		String message="게시물 등록을 실패했습니다.";
		
		result=freeService.freeInsert(freeDTO, session);
		
		if(result>0){
			message="게시물 등록을 성공했습니다.";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./freeList";
	}
	
	//reply->form
	@RequestMapping(value="freeReply", method={RequestMethod.GET})
	public String reply(Model model, int num)throws Exception{
		System.out.println("??????????????????????????");
		
		model.addAttribute("reply", freeService.selectOne(num));
		
		return "free/freeReply";
	}
	
	//reply->database
	@RequestMapping(value="freeReply", method={RequestMethod.POST})
	public String reply(RedirectAttributes rd, FreeDTO freeDTO, HttpSession session)throws Exception{
		int result=0;
		String message="게시물 답글 등록을 실패했습니다.";
		
		result=freeService.freeReply(freeDTO, session);
		
		if(result>0){
			message="게시물 답글 등록을 성공했습니다.";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./freeList";
	}
	
	//update->form
	@RequestMapping(value="freeUpdate", method={RequestMethod.GET})
	public String update(Model model, int num)throws Exception{
		Map<String, Object> map=freeService.selectOne(num);
		List<String> storeList=freeService.storeList();
		
		model.addAttribute("storeList", storeList);
		model.addAttribute("fileCount", map.get("fileCount"));
		model.addAttribute("update", map.get("freeDTO"));
		
		return "free/freeUpdate";
	}
	
	//update->database
	@RequestMapping(value="freeUpdate", method={RequestMethod.POST})
	public String update(RedirectAttributes rd, FreeDTO freeDTO, HttpSession session)throws Exception{
		int result=0;
		String message="게시물 수정을 실패했습니다.";
		
		result=freeService.update(freeDTO, session);
		
		if(result>0){
			message="게시물 수정을 성공했습니다.";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./freeList";
	}
	
	//delete
	@RequestMapping(value="freeDelete")
	public String delete(int num, RedirectAttributes rd)throws Exception{
		int result=0;
		String message="게시물 삭제를 실패했습니다.";
		
		result=freeService.delete(num);
		
		if(result>0){
			message="게시물 삭제를 성공했습니다.";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./freeList";
	}
	
	//fileDelete
	@RequestMapping(value="fileDelete")
	@ResponseBody
	public String fileDelete(int fnum)throws Exception{
		String message="파일 삭제를 실패했습니다.";
		int result=0;
		
		result=freeService.fileDelete(fnum);
		
		if(result>0){
			message="해당 파일을 삭제하였습니다.";
		}
		
		
		return message;
	}
}
