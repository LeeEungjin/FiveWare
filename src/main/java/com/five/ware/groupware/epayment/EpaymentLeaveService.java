package com.five.ware.groupware.epayment;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.five.ware.file.FileDTO;
import com.five.ware.util.ListData;
import com.five.ware.util.Pager;
import com.five.ware.util.RowNum;

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
	
	public int epaymentFile(FileDTO fileDTO) throws Exception{
		int result = epaymentLeaveDAO.epaymentFile(fileDTO);
		
		return result;
	}
	
		public void myepaymentList(int statenum, String code, Model model, ListData listdata) throws Exception{
			RowNum rowNum= listdata.makeRow();
		
			int totalCount = epaymentLeaveDAO.myepaymentListCount(code, statenum, rowNum);
			
			System.out.println(totalCount);
			
			Pager pager= listdata.makePage(totalCount);
			
			//결재자리스트
			List<EpaymentLeaveDTO> ar2= new ArrayList<EpaymentLeaveDTO>();
			//결재내용
			List<EpaymentDTO> list = new ArrayList<EpaymentDTO>();
			
			List<List<EpaymentLeaveDTO>> ar22 = new ArrayList<List<EpaymentLeaveDTO>>();
		
			List<EpaymentLeaveDTO> ar = epaymentLeaveDAO.myepaymentList(code, statenum ,rowNum);
			
			List<FileDTO> fileList = new ArrayList<FileDTO>();
			
			List<List<FileDTO>> file = new ArrayList<List<FileDTO>>();
			
			
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
			
			for(EpaymentDTO a : list){
				fileList = epaymentLeaveDAO.epaymentFileList(a.getDocunum());
				
				file.add(fileList);				
			}
			
			model.addAttribute("file", file);
			model.addAttribute("list", list);
			model.addAttribute("docuCon", ar22);
			model.addAttribute("pager", pager);
			
		}
		
		public void totalList(String state, ListData listData, Model model) throws Exception{
			RowNum rowNum= listData.makeRow();
			
			List<EpaymentDTO> ar = epaymentLeaveDAO.totalList(state, rowNum);
			int totalCount = epaymentLeaveDAO.totalListCount(state, rowNum);
			
			Pager pager = listData.makePage(totalCount);
			
			List<FileDTO> fileList = new ArrayList<FileDTO>();
			List<List<FileDTO>> file = new ArrayList<List<FileDTO>>();
			
			for(EpaymentDTO a : ar){
				fileList = epaymentLeaveDAO.epaymentFileList(a.getDocunum());
				
				file.add(fileList);				
			}
			
			model.addAttribute("file", file);
			model.addAttribute("pager", pager);
			model.addAttribute("list", ar);
		
		}
	
	public EpaymentDTO epaymentContents(String docunum, Model model) throws Exception{
		EpaymentDTO epaymentDTO = epaymentLeaveDAO.myepaymentListContents(docunum);
		List<EpaymentLeaveDTO> ar = epaymentLeaveDAO.myepaymentMember(epaymentDTO);
		List<FileDTO> file = epaymentLeaveDAO.epaymentFileList(docunum);
		
		String [] datez = epaymentDTO.getDraftdate().split("-");
		String dataresult = datez[0]+"년 "+datez[1]+"월 "+datez[2] + "일";
		
		model.addAttribute("docuC", epaymentDTO);
		model.addAttribute("signmember", ar);
		model.addAttribute("file", file);
		model.addAttribute("dateresult", dataresult);
		
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
	
	public void storageList(String code, String state, ListData listData, Model model) throws Exception{
		RowNum rowNum = listData.makeRow();
		
		List<EpaymentDTO> ar = epaymentLeaveDAO.storageList(code, state, rowNum);
		int totalCount=epaymentLeaveDAO.storageListCount(code, state, rowNum);
		
		Pager pager =listData.makePage(totalCount);
		
		List<FileDTO> fileList = new ArrayList<FileDTO>();
		List<List<FileDTO>> file = new ArrayList<List<FileDTO>>();
		
		for(EpaymentDTO a : ar){
			fileList = epaymentLeaveDAO.epaymentFileList(a.getDocunum());
			
			file.add(fileList);				
		}
		
		model.addAttribute("file", file);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
	}
	
	public EpaymentDTO viewOneModal(String docunum) throws Exception{
		EpaymentDTO epaymentDTO = epaymentLeaveDAO.viewOneModal(docunum);
		
		return epaymentDTO;
	}

	public void sendEpaymentList(String code, ListData listData, Model model) throws Exception{
		RowNum rowNum = listData.makeRow();
		
		int totalCount = epaymentLeaveDAO.sendEpaymentListCount(code, rowNum);
		
		Pager pager = listData.makePage(totalCount);
		
		List<EpaymentDTO> ar = epaymentLeaveDAO.sendEpaymentList(code, rowNum);
		
		List<FileDTO> fileList = new ArrayList<FileDTO>();
		List<List<FileDTO>> file = new ArrayList<List<FileDTO>>();
		
		for(EpaymentDTO a : ar){
			fileList = epaymentLeaveDAO.epaymentFileList(a.getDocunum());
			System.out.println(fileList.size());
			
			file.add(fileList);				
		}
		
		model.addAttribute("file", file);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
	}
}
