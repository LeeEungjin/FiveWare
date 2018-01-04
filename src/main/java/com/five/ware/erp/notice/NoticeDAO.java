package com.five.ware.erp.notice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.jdbc.core.metadata.HanaCallMetaDataProvider;
import org.springframework.stereotype.Repository;

import com.five.ware.util.RowNum;

@Repository
public class NoticeDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="noticeMapper.";
	
	public int totalCount(RowNum rowNum, String part) throws Exception	{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("kind", rowNum.getKind());
		map.put("search", rowNum.getSearch());
		map.put("part", part);
		
		return sqlSession.selectOne(namespace+"totalCount", map);
	}
	
	public List<NoticeDTO> selectList(RowNum rowNum, String part) throws Exception	{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kind", rowNum.getKind());
		map.put("search", rowNum.getSearch());
		map.put("startRow", rowNum.getStartRow());
		map.put("lastRow", rowNum.getLastRow());
		map.put("part", part);
		return sqlSession.selectList(namespace+"selectList", map);
	}
	
	public NoticeDTO selectOne(int num) throws Exception	{
		
		return sqlSession.selectOne(namespace+"selectOne", num);
	}
	
	/*public NoticeDTO fileView(int num) throws Exception	{
		return sqlSession.selectOne(namespace+"selectFile", num);
	}*/
	
	public int hitUpdate(int num) throws Exception	{
		return sqlSession.update(namespace+"hitUpdate", num);
	}
	
	public int insert(NoticeDTO noticeDTO) throws Exception	{
		
		int result = sqlSession.insert(namespace+"insert", noticeDTO);
		
		return result;
	}
	
	public int getNum() throws Exception	{
		return sqlSession.selectOne(namespace+"getNum");
	}
	
	public int update(NoticeDTO noticeDTO) throws Exception	{
		return sqlSession.update(namespace+"update", noticeDTO);
	}
	
	public int delete(int num) throws Exception	{
		return sqlSession.delete(namespace+"delete", num);
	}
	
	/*public List<NoticeDTO> part(RowNum rowNum, String part) throws Exception	{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kind", rowNum.getKind());
		map.put("search", rowNum.getSearch());
		map.put("startRow", rowNum.getStartRow());
		map.put("lastRow", rowNum.getLastRow());
		map.put("part", part);
		return sqlSession.selectList(namespace+"selectPart", map);
	}*/

}
