package com.five.ware.erp.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.jdbc.core.metadata.HanaCallMetaDataProvider;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="noticeMapper.";
	
	public int totalCount(RowNum rowNum) throws Exception	{
		return sqlSession.selectOne(namespace+"totalCount", rowNum);
	}
	
	public List<NoticeDTO> selectList(RowNum rowNum) throws Exception	{
		return sqlSession.selectList(namespace+"selectList", rowNum);
	}

}
