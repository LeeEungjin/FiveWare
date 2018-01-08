package com.five.ware.erp.human.member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Inject
	MemberDAO memberDAO;
	
	public int memberInsert(MemberDTO memberDTO) throws Exception{
		int result = memberDAO.memberInsert(memberDTO);
		
		return result;
	}
	
	public List<String> rankList() throws Exception{
		List<String> rank=memberDAO.rankList();
		
		return rank;
	}
	
	public List<MemberDTO> memberList(String search) throws Exception{
		List<MemberDTO> ar = memberDAO.memberList(search);
		
		return ar;
	}
	
	public MemberDTO memberOne(String code) throws Exception{
		MemberDTO memberDTO = memberDAO.memberOne(code);
		
		return memberDTO;
	}
	
	public int memberUpdate(MemberDTO memberDTO) throws Exception{
		int result = memberDAO.memberUpdate(memberDTO);
		
		return result;
	}
	
	public int memberDelete(MemberDTO memberDTO) throws Exception{
		int result = memberDAO.memberDelete(memberDTO);
		
		
		return result;
	}
	
	public List<MemberDTO> retireeList(String search) throws Exception{
		List<MemberDTO> ar = memberDAO.retireeList(search);
		
	//	System.out.println("달른걸로 " + memberDTO.getTerm().indexOf("."));
		
		for(MemberDTO memberDTO : ar ){
			
		if(memberDTO.getTerm() != null &&memberDTO.getTerm().indexOf(".")==0){
			System.out.println("이것은 " + memberDTO.getTerm().indexOf("."));
			memberDTO.setTerm(0+memberDTO.getTerm());
		}
		}
		
		return ar;
	}
	
	public int retireeDelete(MemberDTO memberDTO) throws Exception{
		int result = memberDAO.retireeDelete(memberDTO);
		
		return result;
	}
}
