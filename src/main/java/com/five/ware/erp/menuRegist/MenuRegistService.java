package com.five.ware.erp.menuRegist;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.util.ListData;

@Service
public class MenuRegistService {
	
	@Inject
	private MenuRegistDAO menuRegistDAO;
	
	public int menuRegistInsert(MenuRegistDTO menuRegistDTO)throws Exception{
		int result=menuRegistDAO.memuRegistinsert(menuRegistDTO);
		
		return result;
	}
	
	public ModelAndView selectList(ListData listData, String order, String menukind)throws Exception{
		ModelAndView mv=new ModelAndView();

		
			int totalCount=menuRegistDAO.totalCount(listData.makeRow(), menukind);
			
			mv.setViewName("erp/foundation/menuRegist");
			mv.addObject("pager", listData.makePage(totalCount));
			mv.addObject("mr_list", menuRegistDAO.selectList(listData.makeRow(), order, menukind));

		
		return mv;
	}
	
/*	public ModelAndView mrPriceHigh(ListData listData)throws Exception{
		ModelAndView mv=new ModelAndView();
		int totalCount=menuRegistDAO.totalCount(listData.makeRow());
		
		mv.setViewName("erp/foundation/menuRegist");
		mv.addObject("pager", listData.makePage(totalCount));
		mv.addObject("mr_list", menuRegistDAO.selectList(listData.makeRow()));
		
		return mv;
	}*/
	
	public MenuRegistDTO selectOne(String menuCode)throws Exception{
		MenuRegistDTO menuRegistDTO=menuRegistDAO.selectOne(menuCode);
		return menuRegistDTO;
	}
	
	public int update(MenuRegistDTO menuRegistDTO)throws Exception{
		return menuRegistDAO.update(menuRegistDTO);
	}
	
	public int delete(String menuCode)throws Exception{
		return menuRegistDAO.delete(menuCode);
	}
	

}
