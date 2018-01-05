package com.five.ware.erp.chit;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.erp.accountRegist.AccountRegistDTO;
import com.five.ware.erp.tempRegist.TempRegistDTO;
import com.five.ware.util.ListData;
import com.five.ware.util.Pager;
import com.five.ware.util.RowNum;

@Service
public class ChitService {

	@Inject
	private ChitDAO chitDAO;
	
	
	//update
	public int update(String code,String approval) throws Exception{
		int result= chitDAO.update(code,approval);
		return result;
	}
	
	//chitSeletOne
	public ChitDTO chitSelectOne(String code) throws Exception{
		ChitDTO chitDTO=chitDAO.chitSelectOne(code);
		return chitDTO;
	}
	
	//chitApprovalList
	public ModelAndView chitApprovalList(ListData listData,String approval) throws Exception{
		RowNum rowNum=listData.makeRow();
		
		int totalCount=chitDAO.totalCount(rowNum);
		
		Pager pager=listData.makePage(totalCount);
		
		List<ChitDTO> ar=new ArrayList<ChitDTO>();
		
		ar=chitDAO.chitApprovalList(rowNum, listData, approval);
		
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		
		return mv;
	}

	
	//delete
	public int delete(String code) throws Exception{
		int result=chitDAO.delete(code);
		return result;
	}
	//insert
	public int insert(ChitDTO chitDTO) throws Exception{
		int result=chitDAO.insert(chitDTO);
		
		return result;
	}
	
	
	
	//accountList
	public ModelAndView chitAccountList() throws Exception{
		List<AccountRegistDTO> ar=new ArrayList<AccountRegistDTO>();
		ar=chitDAO.chitAccountList();
		
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("list", ar);
		
		return mv;
	}
	
	//tempList
	public ModelAndView chitTempList() throws Exception{
		List<TempRegistDTO> ar=new ArrayList<TempRegistDTO>();
		ar=chitDAO.chitTempList();
		ModelAndView mv=new ModelAndView();
		mv.addObject("list", ar);
		
		return mv;
	}


}
