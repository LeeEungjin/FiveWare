package com.five.ware.erp.accountRegist;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.util.ListData;
import com.five.ware.util.Pager;
import com.five.ware.util.RowNum;

@Service
public class AccountRegistService {
	
	@Inject
	private AccountRegistDAO accountRegitsDAO;
	
	//insert
	public int insert(AccountRegistDTO accountRegistDTO) throws Exception{
		int result=accountRegitsDAO.insert(accountRegistDTO);
		
		return result;
	}
	
	//list
	public ModelAndView selectList(ListData listData) throws Exception{
		
		RowNum rowNum=listData.makeRow();
		int totalCount=accountRegitsDAO.totalCount(rowNum);
		List<AccountRegistDTO> ar=new ArrayList<AccountRegistDTO>();
		ar=accountRegitsDAO.selectList(rowNum, listData);
		Pager pager=listData.makePage(totalCount);
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		
		return mv;
	}

}
