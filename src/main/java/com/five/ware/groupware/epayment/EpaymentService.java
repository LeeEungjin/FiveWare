package com.five.ware.groupware.epayment;

<<<<<<< HEAD


import java.util.ArrayList;
=======
import java.util.ArrayList; 
>>>>>>> master
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.util.ListData;
import com.five.ware.util.Pager;
import com.five.ware.util.RowNum;

@Service
public class EpaymentService {

	@Inject
	EpaymentDAO epaymentDAO;
	
	
	//epayment View
	public EpaymentDTO epaymentView(String num)throws Exception{
		EpaymentDTO epaymentDTO=epaymentDAO.epaymentView(num);
		
		return epaymentDTO; 
	}
	
	//insert
	public int epaymentInsert(EpaymentDTO epaymentDTO) throws Exception{
		int result = epaymentDAO.epaymentInsert(epaymentDTO);
		
		return result;
	}
	

	public List<String> tempList() throws Exception{
		List<String> temps=epaymentDAO.tempList();
		
		return temps;
	}
	
	//epayment List
	public ModelAndView epaymentList(ListData listData) throws Exception{
		RowNum rowNum=listData.makeRow();
		
		int totalCount=epaymentDAO.totalCount(rowNum);
		
		Pager pager=listData.makePage(totalCount);
		
		List<EpaymentDTO> ar=new ArrayList<EpaymentDTO>();
		ar=epaymentDAO.epaymentList(rowNum, listData);
		
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("epaymentList", ar);
		mv.addObject("pager", pager);
		
		return mv;
<<<<<<< HEAD
=======
		
>>>>>>> master

	}
}
