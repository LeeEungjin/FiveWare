package com.five.ware.erp.chit;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.accountRegist.AccountRegistDTO;
import com.five.ware.erp.tempRegist.TempRegistDTO;

@Service
public class ChitService {

	@Inject
	private ChitDAO chitDAO;
	
	//accountList
	public ModelAndView chitAccountList() throws Exception{
		List<AccountRegistDTO> ar=new ArrayList<AccountRegistDTO>();
		ar=chitDAO.chitAccountList();
		
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("list", ar);
		
		return mv;
	}
	
	//tempList
	public List<String> chitTempList() throws Exception{
		List<String> ar=new ArrayList<String>();
		ar=chitDAO.chitTempList();
			
		return ar;
	}
}
