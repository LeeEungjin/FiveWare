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
}
