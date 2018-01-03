package com.five.ware.erp.human.basis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class SalDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="humanSalMapper.";
	
	public int salInsert(SalDTO salDTO) throws Exception{
		int result = sqlSession.insert(NAMESPACE+"salInsert", salDTO);
		
		return result;
	}
	
	public List<SalDTO> salList(String search) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("search", search);
		
		List<SalDTO> ar = sqlSession.selectList(NAMESPACE+"salList", map);
		
		return ar;
	}
	
	public SalDTO salOne(String code) throws Exception{
		SalDTO salDTO = sqlSession.selectOne(NAMESPACE+"salOne", code);
		
		return salDTO;
	}
	
	public int salUpdate(SalDTO salDTO) throws Exception{
		int result = sqlSession.update(NAMESPACE+"salUpdate", salDTO);
		
		return result;
	}
	
	public int salDelete(String code) throws Exception{
		int result=sqlSession.delete(NAMESPACE+"salDelete",code);
		
		return result;
	}

}
