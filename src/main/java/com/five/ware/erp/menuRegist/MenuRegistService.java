package com.five.ware.erp.menuRegist;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.storeRegist.StoreRegistDTO;
import com.five.ware.file.FileDAO;
import com.five.ware.file.FileDTO;
import com.five.ware.util.ListData;
import com.five.ware.util.Pager;
import com.five.ware.util.RowNum;

@Transactional
@Service
public class MenuRegistService {
	
	@Inject
	private MenuRegistDAO menuRegistDAO;
	
	@Autowired
	private FileDAO fileDAO;
	

	//menuList
	public void storeSelectList(ListData listData, String order, String menukind,Model model)throws Exception{
		ModelAndView mv=new ModelAndView();

		RowNum rowNum=listData.makeRow();
		
		int totalCount=menuRegistDAO.totalCount(rowNum, menukind);
		
		Pager pager=listData.makePage(totalCount);
		
		List<MenuRegistDTO> ar=new ArrayList<MenuRegistDTO>();
		
		ar=menuRegistDAO.selectList(rowNum, order, menukind);
		
		
		model.addAttribute("mr_list", ar);


		
	}
	//pos 메뉴
	public ModelAndView posMenu(String menuKind)throws Exception{
		ModelAndView mv=new ModelAndView();
		mv.addObject("pos_menu", menuRegistDAO.posMenu(menuKind));
		
		return mv;
	}
	
	public int menuRegistInsert(MenuRegistDTO menuRegistDTO)throws Exception{
		List<FileDTO> ar=fileDAO.selectList(menuRegistDTO.getMenuCode());

		if(ar.size()>0){
			menuRegistDTO.setImgNull("true");
		}
		
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
	
	public Map<String, Object> selectOne(String menuCode)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<FileDTO> ar = fileDAO.selectList(menuCode);
		MenuRegistDTO menuRegistDTO=menuRegistDAO.selectOne(menuCode);
		
		map.put("menuView", menuRegistDTO);
		map.put("files", ar);
		
		return map;
	}
	
	public int update(MenuRegistDTO menuRegistDTO)throws Exception{
		return menuRegistDAO.update(menuRegistDTO);
	}
	
	public int delete(String menuCode)throws Exception{
		int result=menuRegistDAO.delete(menuCode);
			result=fileDAO.delete(menuCode);
			
		return result;
	}
	

}
