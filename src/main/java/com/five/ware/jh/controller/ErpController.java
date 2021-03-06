package com.five.ware.jh.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.five.ware.erp.menuRegist.MenuRegistDTO;
import com.five.ware.erp.menuRegist.MenuRegistService;
import com.five.ware.erp.storageRegist.StorageRegistDTO;
import com.five.ware.erp.storageRegist.StorageRegistService;
import com.five.ware.util.ListData;


@Controller
@RequestMapping(value="erp/foundation/**")
public class ErpController {
	
	@Autowired
	private MenuRegistService menuRegistService;
	@Autowired
	private StorageRegistService storageService;

	
	@RequestMapping(value="menuRegist")
	public ModelAndView menuRegist(ListData listData, @RequestParam(defaultValue="no", required=false)String order, @RequestParam(defaultValue="no", required=false)String menukind){
		ModelAndView modelAndView=null;
		
		try{
		modelAndView=menuRegistService.selectList(listData, order, menukind);
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value="menuRegistWrite", method=RequestMethod.POST)
	public String menuRegist(MenuRegistDTO menuRegistDTO, RedirectAttributes rd){
		int result=0;
		String message="메뉴 등록을 실패했습니다.";
		
		try {
			result=menuRegistService.menuRegistInsert(menuRegistDTO);
			if(result>0){
				message="메뉴 등록을 성공했습니다.";
			}
			rd.addFlashAttribute("message", message);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:./menuRegist";
	}
	
	@RequestMapping(value="menuRegistView", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> selectOne(String menuCode)throws Exception{
		 Map<String, Object> map=new HashMap<String, Object>();
		 
		 try {
			 map=menuRegistService.selectOne(menuCode);
		 } catch (Exception e) {
				e.printStackTrace();
		}
		 
		return map;
	}
	
	@RequestMapping(value="menuRegistUpdate", method=RequestMethod.POST)
	public String update(MenuRegistDTO menuRegistDTO, RedirectAttributes rd)throws Exception{
		String message="메뉴 수정을 실패했습니다.";
		int result=menuRegistService.update(menuRegistDTO);
		
		if(result>0){
			message="메뉴 수정을 성공했습니다.";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./menuRegist";
	}
	
	@RequestMapping(value="menuRegistDelete")
	public String delete(String menuCode, RedirectAttributes rd)throws Exception{
		String message="메뉴 삭제를 실패하였습니다.";
		int result=menuRegistService.delete(menuCode);
		
		if(result>0){
			message="메뉴 삭제를 성공하였습니다.";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./menuRegist";
	}
	

	
/////////////////////////////////////////////////////////////////////////////////////////////
	
	
	@RequestMapping(value="storageRegist")
	public ModelAndView storageRegist(ListData listData){
		ModelAndView modelAndView=null;
		try{
		modelAndView=storageService.selectList(listData);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return modelAndView;
	}
	
	@RequestMapping(value="storagetWrite", method=RequestMethod.POST)
	public String storageWrite(StorageRegistDTO storageRegistDTO, RedirectAttributes rd){
		int result=0;
		String message="창고 등록을 실패하였습니다.";
		try {
			result=storageService.insert(storageRegistDTO);
			if(result>0){
				message="창고 등록을 성공하였습니다.";
			}
			rd.addFlashAttribute("message", message);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:./storageRegist";
	}
	
	@RequestMapping(value="storageView", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> selectOneStorage(Model model, String storageCode)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map=storageService.selectOne(storageCode);

		return map;
	}
	
	@RequestMapping(value="storageUpdate", method=RequestMethod.POST)
	public String update(StorageRegistDTO storageRegistDTO, RedirectAttributes rd)throws Exception{
		String message="창고 수정을 실패하였습니다.";
		int result=storageService.update(storageRegistDTO);
		
		if(result>0){
			message="창고 수정을 성공하였습니다.";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./storageRegist";
	}
	
	@RequestMapping(value="storageDelete")
	public String deleteStorage(String storageCode, RedirectAttributes rd)throws Exception{
		String message="창고 삭제를 실패하였습니다.";
		int result=storageService.delete(storageCode);
		
		if(result>0){
			message="창고 삭제를 성공하였습니다.";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./storageRegist";
	}
}
