package com.five.ware.erp.tempRegist;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.util.ListData;
import com.five.ware.util.Pager;
import com.five.ware.util.RowNum;

@Service
public class TempRegistService {

	@Inject
	private TempRegistDAO tempRegistDAO;
	
	//delete
	public int delete(String code) throws Exception{
		int result=tempRegistDAO.delete(code);
		
		return result;
		
	}
	
	//update
	public int update(TempRegistDTO tempRegistDTO) throws Exception{
		int result=tempRegistDAO.update(tempRegistDTO);
		
		return result;
	}
	
	//selectOne
	public TempRegistDTO selectOne(String code) throws Exception{
		
		TempRegistDTO tempRegistDTO=tempRegistDAO.selectOne(code);
		return tempRegistDTO;
	}
	
	//insert
	public int insert(TempRegistDTO tempRegistDTO) throws Exception{
		
		int result=tempRegistDAO.insert(tempRegistDTO);
		
		return result;
	}
	
	//list
	public ModelAndView selectList(ListData listData) throws Exception{
		
		RowNum rowNum=listData.makeRow();
		
		int totalCount=tempRegistDAO.totalCount(rowNum);
		
		Pager pager=listData.makePage(totalCount);
		
		List<TempRegistDTO> ar=new ArrayList<TempRegistDTO>();
		
		ar=tempRegistDAO.selectList(rowNum, listData);
		
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		
		return mv;
	}
}
