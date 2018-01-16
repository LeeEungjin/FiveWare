package com.five.ware.groupware.epayment;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class EpaymentLeaveService {

	@Inject
	EpaymentLeaveDAO epaymentLeaveDAO;
	
	public int approvalInsert(EpaymentLeaveDTO epaymentLeaveDTO) throws Exception{
		String approvalcode = epaymentLeaveDTO.getApprovalcode();
		String approvalname = epaymentLeaveDTO.getApprovalname();
		String approvaltemp = epaymentLeaveDTO.getApprovaltemp();
		String approvalrank = epaymentLeaveDTO.getApprovalrank();
		
		System.out.println(approvalcode);
		System.out.println(approvalname);
		System.out.println(approvaltemp);
		System.out.println(approvalrank);
		
		String code[] = approvalcode.split(",");
		String name[]=approvalname.split(",");
		String temp[] = approvaltemp.split(",");
		String rank[] = approvalrank.split(",");
		
		int result=0;
		
		for(int i=0; i<code.length; i++){
			epaymentLeaveDTO.setApprovalcode(code[i]);
			epaymentLeaveDTO.setApprovalname(name[i]);
			epaymentLeaveDTO.setApprovalrank(rank[i]);
			epaymentLeaveDTO.setApprovaltemp(temp[i]);
			epaymentLeaveDTO.setRanking(String.valueOf(i));		
			
			result = epaymentLeaveDAO.approvalInsert(epaymentLeaveDTO);
		}
	 
	return result;
	}
}
