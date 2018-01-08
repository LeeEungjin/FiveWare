package com.five.ware.erp.human.member;

import java.lang.management.MemoryManagerMXBean;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<MemberDTO> memberList(String search) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("search", search);
		
		List<MemberDTO> ar = sqlSession.selectList(NAMESPACE+"memberList", map);
		
		return ar;
	}
	
	public MemberDTO memberOne(String code) throws Exception{
		MemberDTO memberDTO = sqlSession.selectOne(NAMESPACE+"memberOne", code);
		
		return memberDTO;
	}
	
	public int memberUpdate(MemberDTO memberDTO) throws Exception{
		int result = sqlSession.update(NAMESPACE+"memberUpdate", memberDTO);
		
		return result;
	}
	
	public int memberDelete(MemberDTO memberDTO) throws Exception{
		int result =sqlSession.update(NAMESPACE+"memberDelete", memberDTO);
		
		return result;
	}
	
	public List<MemberDTO> retireeList(String search) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("search", search);
		map.put("kind", "퇴직"	);
		
		System.out.println("dd");
		List<MemberDTO> ar = sqlSession.selectList(NAMESPACE+"retireeList", map);
		System.out.println(ar.size());
		return ar;
	}
	
	
	public int retireeDelete(MemberDTO memberDTO) throws Exception{
		
		int result = sqlSession.update(NAMESPACE+"retireeDelete", memberDTO);
		
		return result;
	}
}
