package com.five.ware.groupware.epayment;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.erp.human.member.MemberDTO;

@Repository
public class EpaymentDAO {

	@Inject
	SqlSession sqlSession;
	private final String NAMESPACE="epaymentMapper.";
	
	public int epaymentInsert(EpaymentDTO epaymentDTO) throws Exception{
		int result = sqlSession.insert(NAMESPACE+"epaymentInsert", epaymentDTO);
		
		return result;
	}
	
	public List<String> tempList() throws Exception{
		List<String> temps=sqlSession.selectList(NAMESPACE+"tempList");
		
		return temps;
	}
	
	public List<MemberDTO> tempMember(String temp) throws Exception{
		List<MemberDTO> members=sqlSession.selectList(NAMESPACE+"tempMember", temp);
		
		return members;
	}
	
	public MemberDTO memberSelect(String code) throws Exception{
		MemberDTO memberDTO = sqlSession.selectOne(NAMESPACE+"memberSelect", code);
		
		return memberDTO;
	}
}
