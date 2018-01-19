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
	
		public void myepaymentList(int statenum, String code, Model model) throws Exception{
			//결재자리스트
			List<EpaymentLeaveDTO> ar2= new ArrayList<EpaymentLeaveDTO>();
			//결재내용
			List<EpaymentDTO> list = new ArrayList<EpaymentDTO>();
			
			List<List<EpaymentLeaveDTO>> ar22 = new ArrayList<List<EpaymentLeaveDTO>>();
		
			List<EpaymentLeaveDTO> ar = epaymentLeaveDAO.myepaymentList(code, statenum);
			
			for(EpaymentLeaveDTO epaymentLeaveDTO : ar){
				if(statenum==1){
				
					epaymentLeaveDTO.setRanking(String.valueOf(Integer.parseInt(epaymentLeaveDTO.getRanking())+1));
				}
				
				if(statenum==-1){
					epaymentLeaveDTO.setRanking("-1");
				}
				
				EpaymentLeaveDTO e = epaymentLeaveDAO.myepaymentList2(epaymentLeaveDTO);
				
				if(e!=null){
					ar2.add(e);
				}
			}
			
			EpaymentDTO epaymentDTO = null;
			
			for(EpaymentLeaveDTO epaymentLeaveDTO : ar2){
				epaymentDTO = epaymentLeaveDAO.myepaymentListContents(epaymentLeaveDTO.getDocunum());
				
				list.add(epaymentDTO);
				
				ar2 = epaymentLeaveDAO.myepaymentMember(epaymentDTO);
				ar22.add(ar2);
			}
			
			String longdate = epaymentDTO.getDraftdate();
			
			String [] year = longdate.split("-");
			
			model.addAttribute("year", year[0]);
			model.addAttribute("month", year[1]);
			model.addAttribute("day", year[2]);
			
			System.out.println(year[0]);
			
			model.addAttribute("list", list);
			model.addAttribute("docuCon", ar22);
			
		}
		
		public List<EpaymentDTO> totalList(String state) throws Exception{
			List<EpaymentDTO> ar = epaymentLeaveDAO.totalList(state);
			
			return ar;
		}
	
	
	public EpaymentDTO epaymentContents(String docunum, Model model) throws Exception{
		EpaymentDTO epaymentDTO = epaymentLeaveDAO.myepaymentListContents(docunum);
		List<EpaymentLeaveDTO> ar = epaymentLeaveDAO.myepaymentMember(epaymentDTO);
		
		model.addAttribute("docuC", epaymentDTO);
		model.addAttribute("signmember", ar);
		
		System.out.println(ar.size());
		
		return epaymentDTO;
	}
	
	public String stampok(EpaymentLeaveDTO epaymentLeaveDTO) throws Exception{
		int result = epaymentLeaveDAO.stampok(epaymentLeaveDTO);
		
		String message="결재 실패";
		String kind="";
		
		if(epaymentLeaveDTO.getApprovalname().equals("기결")){
			kind="승인";
			
			String ranking = epaymentLeaveDAO.maxRanking(epaymentLeaveDTO);
			
			if(ranking.equals(epaymentLeaveDTO.getRanking())){
				 epaymentLeaveDAO.stampok2(epaymentLeaveDTO);
			}
		}else if(epaymentLeaveDTO.getApprovalname().equals("반려")){
			kind="반려";
			
			epaymentLeaveDAO.stampok2(epaymentLeaveDTO);
		}
		
		
		if(result>0 ){
			message="결재가 "+kind+"되었습니다.";
		}
		
		return message;
	}
	
	public List<EpaymentDTO> storageList(String code, String state) throws Exception{
		List<EpaymentDTO> ar = epaymentLeaveDAO.storageList(code, state);
		
		return ar;
	}
	
	public EpaymentDTO viewOneModal(String docunum) throws Exception{
		EpaymentDTO epaymentDTO = epaymentLeaveDAO.viewOneModal(docunum);
		
		return epaymentDTO;
	}

}
