package com.five.ware.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.util.RowNum;

@Repository
public class CommunityDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="communityMapper.";
	
	public int fileCount(int num)throws Exception{
		return sqlSession.selectOne(namespace+"fileCount", num);
	}
	
	public int totalCount(RowNum rowNum, String temp)throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		
		map.put("kind", rowNum.getKind());
		map.put("search", rowNum.getSearch());
		map.put("temp", temp);
		
		return sqlSession.selectOne(namespace+"totalCount", map);
	}
	
	public List<CommunityDTO> selectList(RowNum rowNum, String temp)throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		
		map.put("kind", rowNum.getKind());
		map.put("search", rowNum.getSearch());
		map.put("startRow", rowNum.getStartRow());
		map.put("lastRow", rowNum.getLastRow());
		map.put("temp", temp);
		
		return sqlSession.selectList(namespace+"selectList", map);
	}
	
	public CommunityDTO selectOne(int num)throws Exception{
		return sqlSession.selectOne(namespace+"selectOne", num);
	}
	
	public int insert(CommunityDTO communityDTO)throws Exception{
		return sqlSession.insert(namespace+"insert", communityDTO);
	}
	
	public int delete(int num)throws Exception{
		return sqlSession.delete(namespace+"delete", num);
	}
	
	public int fileDelete(int num)throws Exception{
		return sqlSession.delete(namespace+"fileDelete", num);
	}
	
	public int update(CommunityDTO communityDTO)throws Exception{
		return sqlSession.update(namespace+"update", communityDTO);
	}
	
	public int hitUpdate(int num)throws Exception{
		return sqlSession.update(namespace+"hitUpdate", num);
	}
	
	public int getNum()throws Exception{
		return sqlSession.selectOne(namespace+"getNum");
	}
}
