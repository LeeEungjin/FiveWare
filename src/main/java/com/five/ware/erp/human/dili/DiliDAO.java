package com.five.ware.erp.human.dili;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class DiliDAO {

	@Inject
	SqlSession sqlSession;
	private final String NAMESPACE="humanDiliMapper.";
	
	public int diliInsert(DiliDTO diliDTO) throws Exception{
		int result = sqlSession.insert(NAMESPACE+"diliInsert", diliDTO);
		
		return result;
	}
	
	public List<DiliDTO> diliList(String search) throws Exception{
		Map<String, String>map = new HashMap<String, String>();
		
		map.put("search", search);
		
		List<DiliDTO> ar = sqlSession.selectList(NAMESPACE+"diliList", map);
		
		return ar;
	}
	
	public DiliDTO diliOne(String code) throws Exception{
		DiliDTO diliDTO = sqlSession.selectOne(NAMESPACE+"diliOne", code);
		
		return diliDTO;
	}
	
	public int diliUpdate(DiliDTO diliDTO) throws Exception{
		int result=sqlSession.update(NAMESPACE+"diliUpdate", diliDTO);
		
		return result;
	}
	
	public int diliDelete(String code) throws Exception{
		int result = sqlSession.delete(NAMESPACE+"diliDelete", code);
		
		return result;
	}
}
