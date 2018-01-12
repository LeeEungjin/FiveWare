package com.five.ware.erp.human.dili;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.five.ware.erp.human.member.MemberDTO;

@Repository
public class MemberWorkDAO {

	@Inject
	SqlSession sqlSession;
	private final String NAMESPACE="humanDiliInputMapper.";
	private final String NAMESPACE2="humanDiliSearchMapper.";
	
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
	
	public List<MemberWorkDTO> memberWorkList(String search, @RequestParam(defaultValue="2018-01-01", required=false) String startdate, @RequestParam(defaultValue="2018-12-31", required=false)String enddate) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("search", search);
		map.put("startdate", startdate);
		map.put("enddate", enddate);
		
		
		List<MemberWorkDTO> ar= sqlSession.selectList(NAMESPACE+"memberWorkList", map );
		
		return ar;
	}
	
	public MemberWorkDTO mworkOne(int num) throws Exception{
		MemberWorkDTO memberWorkDTO = sqlSession.selectOne(NAMESPACE+"mworkOne", num);
		
		return memberWorkDTO;
	}
	
	public int mworkUpdate(MemberWorkDTO memberWorkDTO) throws Exception{
		int result = sqlSession.update(NAMESPACE+"mworkUpdate", memberWorkDTO);
		
		return result;
	}
	
	public int mworkDelete(int num) throws Exception{
		int result = sqlSession.delete(NAMESPACE+"mworkDelete", num);
		
		return result;
	}
	
	public List<MemberWorkDTO> mWorkList(String search) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("search", search);
		
		List<MemberWorkDTO> ar = sqlSession.selectList(NAMESPACE2+"mWorkList", map);
		
		return ar;
	}
	
	public int mSumList(String code, String workname) throws Exception{
		Map<String, String>map = new HashMap<String, String>();
		
		map.put("code", code);
		map.put("workname", workname);
		
		return sqlSession.selectOne(NAMESPACE2+"mSumList", map);
		
		
	}
}
