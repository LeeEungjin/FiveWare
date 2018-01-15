package com.five.ware.groupware.epayment;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class EpaymentService {

	@Inject
	EpaymentDAO epaymentDAO;
	
	public int epaymentInsert(EpaymentDTO epaymentDTO) throws Exception{
		int result = epaymentDAO.epaymentInsert(epaymentDTO);
		
		return result;
	}
	
	public List<String> tempList() throws Exception{
		List<String> temps=epaymentDAO.tempList();
		
		return temps;
	}
	
	public List<String> tempMember(String temp) throws Exception{
		List<String> members=epaymentDAO.tempMember(temp);
		
		return members;
	}
}
