package com.five.ware.erp.human.member;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Inject
	SqlSession sqlSession;
	private final String NAMESPACE="humanMemberMapper.";
	
	public int memberInsert(MemberDTO memberDTO) throws Exception{
		int result = sqlSession.insert(NAMESPACE+"memberInsert", memberDTO);
		
		return result;
	}
	
	public List<String> rankList() throws Exception{
		List<String> rank = sqlSession.selectList(NAMESPACE+"rankList");
		
		return rank;
	}
}
