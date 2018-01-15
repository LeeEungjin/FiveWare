package com.five.ware.groupware.epayment;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.five.ware.erp.human.member.MemberDTO;

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
	
	public List<MemberDTO> tempMember(String temp) throws Exception{
		List<MemberDTO> members=epaymentDAO.tempMember(temp);
		
		return members;
	}
	
	public MemberDTO memberSelect(String code) throws Exception{
		MemberDTO memberDTO = epaymentDAO.memberSelect(code);
		
		return memberDTO;
	}
}
