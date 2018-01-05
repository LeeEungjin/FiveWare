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
	
	public int memberDelete(String code) throws Exception{
		int result = memberDAO.memberDelete(code);
		
		return result;
	}
}
