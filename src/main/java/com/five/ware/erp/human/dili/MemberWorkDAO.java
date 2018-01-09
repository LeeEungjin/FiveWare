package com.five.ware.erp.human.dili;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.erp.human.member.MemberDTO;

@Repository
public class MemberWorkDAO {

	@Inject
	SqlSession sqlSession;
	private final String NAMESPACE="humanDiliInputMapper.";
	
	public List<String> diliNameList() throws Exception{
		List<String> ar = sqlSession.selectList(NAMESPACE+"diliNameList");
		
		return ar;
	}
	
	public List<MemberDTO> memList() throws Exception{
		List<MemberDTO> ar = sqlSession.selectList(NAMESPACE+"memList");
		
		return ar;
	}
	
	public List<String> tempList() throws Exception{
		List<String> ar= sqlSession.selectList(NAMESPACE+"tempList");
		
		return ar;
	}
	
	public int memdiliInsert(MemberWorkDTO memberWorkDTO) throws Exception{
		int result = sqlSession.insert(NAMESPACE+"memdiliInsert", memberWorkDTO);
		
		return result;
	}
	
	public String workCodeSearch(String workname) throws Exception{
		String workcode=sqlSession.selectOne(NAMESPACE+"workCodeSearch", workname);
		
		return workcode;
	}
}
