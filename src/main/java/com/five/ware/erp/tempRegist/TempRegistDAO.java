package com.five.ware.erp.tempRegist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.util.ListData;
import com.five.ware.util.RowNum;

@Repository
public class TempRegistDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String namespace="tempRegistMapper.";
	
	
	//delete
	public int delete(String code) throws Exception{
		
		return sqlSession.delete(namespace+"delete", code);
	}
	
	//update
	public int update(TempRegistDTO tempRegistDTO) throws Exception{
		
		return sqlSession.update(namespace+"update", tempRegistDTO);
	}
	//selectOne
	public TempRegistDTO selectOne(String code) throws Exception{
		
		return sqlSession.selectOne(namespace+"selectOne", code);
	}
	
	
	//insert
	public int insert(TempRegistDTO tempRegistDTO) throws Exception{
		
		int result=sqlSession.insert(namespace+"insert", tempRegistDTO);
		
		return result;
	}
	
	//list
	public List<TempRegistDTO> selectList(RowNum rowNum, ListData listData) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("startRow", rowNum.getStartRow());
		map.put("lastRow", rowNum.getLastRow());
		map.put("kind", listData.getKind());
		map.put("search", listData.getSearch());
		
		return sqlSession.selectList(namespace+"selectList", map);
		
	}
	
	//totalCount
	public int totalCount(RowNum rowNum) throws Exception{
		
		return sqlSession.selectOne(namespace+"totalCount", rowNum);
	}
}
