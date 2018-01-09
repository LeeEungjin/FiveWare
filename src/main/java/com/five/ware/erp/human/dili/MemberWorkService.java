package com.five.ware.erp.human.dili;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.five.ware.erp.human.member.MemberDTO;

@Service
public class MemberWorkService {

	@Inject
	MemberWorkDAO memberWorkDAO;
	
	public List<String> diliNameList() throws Exception{
		List<String> ar = memberWorkDAO.diliNameList();
		
		return ar;
	}
	
	public List<MemberDTO> memList() throws Exception{
		List<MemberDTO> ar = memberWorkDAO.memList();
		
		return ar;
	}
	
	public List<String> tempList() throws Exception{
		List<String> ar=  memberWorkDAO.tempList();
		
		return ar;
	}
	
	public int memdiliInsert(MemberWorkDTO memberWorkDTO) throws Exception{
		int result = memberWorkDAO.memdiliInsert(memberWorkDTO);
		
		return result;
	}
	
	public String workCodeSearch(String workname) throws Exception{
		String workcode = memberWorkDAO.workCodeSearch(workname);
		
		return workcode;
	}
}
