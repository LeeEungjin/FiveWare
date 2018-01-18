package com.five.ware.groupware.epayment;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class EpaymentLeaveService {

	@Inject
	EpaymentLeaveDAO epaymentLeaveDAO;
	
	public int approvalInsert(EpaymentLeaveDTO epaymentLeaveDTO) throws Exception{
		String approvalcode = epaymentLeaveDTO.getApprovalcode();
		String approvalname = epaymentLeaveDTO.getApprovalname();
		String approvaltemp = epaymentLeaveDTO.getApprovaltemp();
		String approvalrank = epaymentLeaveDTO.getApprovalrank();
		
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
	
	public void myepaymentList(String code, Model model) throws Exception{
		List<EpaymentLeaveDTO> ar2= new ArrayList<EpaymentLeaveDTO>();
		List<EpaymentDTO> list = new ArrayList<EpaymentDTO>();
		List<List<EpaymentLeaveDTO>> ar22 = new ArrayList<List<EpaymentLeaveDTO>>();
	
		List<EpaymentLeaveDTO> ar = epaymentLeaveDAO.myepaymentList(code);
		
		for(EpaymentLeaveDTO epaymentLeaveDTO : ar){
			EpaymentLeaveDTO e = epaymentLeaveDAO.myepaymentList2(epaymentLeaveDTO);
			
			if(e!=null){
				ar2.add(e);
			}
		}
		
		for(EpaymentLeaveDTO epaymentLeaveDTO : ar2){
			EpaymentDTO epaymentDTO = epaymentLeaveDAO.myepaymentListContents(epaymentLeaveDTO.getDocunum());
			
			list.add(epaymentDTO);
			
			ar2 = epaymentLeaveDAO.myepaymentMember(epaymentDTO);
			ar22.add(ar2);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("docuCon", ar22);
		
	}
	
	public EpaymentDTO epaymentContents(String docunum, Model model) throws Exception{
		EpaymentDTO epaymentDTO = epaymentLeaveDAO.myepaymentListContents(docunum);
		List<EpaymentLeaveDTO> ar = epaymentLeaveDAO.myepaymentMember(epaymentDTO);
		
		model.addAttribute("docuC", epaymentDTO);
		model.addAttribute("signmember", ar);
		
		System.out.println(ar.size());
		
		return epaymentDTO;
	}
	
	public String stampok(String docunum) throws Exception{
		int result = epaymentLeaveDAO.stampok(docunum);
		int result2= epaymentLeaveDAO.stampok2(docunum);
		
		String message="결재 승인 실패";
		
		if(result>0 && result2>0){
			message="결재가 승인되었습니다.";
		}
		
		return message;
	}

}
