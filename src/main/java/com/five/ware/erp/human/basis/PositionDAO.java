package com.five.ware.erp.human.basis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PositionDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="humanPositionMapper.";
	
	public int positionPlus(PositionDTO positionDTO) throws Exception{
		int result=sqlSession.insert(NAMESPACE+"positionInsert", positionDTO);
		
		return result;
	}
	
	public List<PositionDTO> positionList(String search) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("search", search);
		
		List<PositionDTO> ar = sqlSession.selectList(NAMESPACE+"positionList", map);
		
		return ar ;
		
	}
	
	public PositionDTO positionUpdateForm(String code) throws Exception{
		PositionDTO pDTO = sqlSession.selectOne(NAMESPACE+"positionOne", code);
		
		return pDTO;
	}
	
	public int positionUpdate(PositionDTO positionDTO) throws Exception{
		int result = sqlSession.update(NAMESPACE+"positionUpdate", positionDTO);
		
		return result;
	}
	
	public int positionDelete(String code) throws Exception{
		System.out.println("들어오니 여기는 DAO");
		int result = sqlSession.delete(NAMESPACE+"positionDelete", code);
		
		return result;
	}
	
}
