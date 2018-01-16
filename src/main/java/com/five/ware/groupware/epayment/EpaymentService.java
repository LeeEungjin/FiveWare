package com.five.ware.groupware.epayment;




import java.util.ArrayList; 

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.util.ListData;
import com.five.ware.util.Pager;
import com.five.ware.util.RowNum;

import com.five.ware.erp.human.member.MemberDTO;

@Service
public class EpaymentService {

	@Inject
	EpaymentDAO epaymentDAO;
	
	//delete
	public int epaymentDelete(String num)throws Exception{
		int result=epaymentDAO.epaymentDelete(num);
		return result;
	}
	
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
	
<<<<<<< HEAD
<<<<<<< HEAD
=======
	
	//myEpaymentList
	public ModelAndView myEpaymentList(ListData listData) throws Exception{
		RowNum rowNum=listData.makeRow();
		
		int totalCount=epaymentDAO.totalCount(rowNum);
		
		Pager pager=listData.makePage(totalCount);
		
		List<EpaymentDTO> ar=new ArrayList<EpaymentDTO>();
		ar=epaymentDAO.myEpaymentList(rowNum, listData);
		
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("epaymentList", ar);
		mv.addObject("pager", pager);
		
		
		return mv;


	}
	
	
>>>>>>> eunbi2
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


=======
	public List<MemberDTO> tempMember(String temp) throws Exception{
		List<MemberDTO> members=epaymentDAO.tempMember(temp);
		
		return members;
	}
	
	public MemberDTO memberSelect(String code) throws Exception{
		MemberDTO memberDTO = epaymentDAO.memberSelect(code);
		
		return memberDTO;
>>>>>>> arin
	}
}
