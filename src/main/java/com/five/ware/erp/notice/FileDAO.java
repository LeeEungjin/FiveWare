package com.five.ware.erp.notice;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAO {

	@Inject
	private SqlSession sqlSession;
	
	private final String NAMESPACE="fileMapper.";
	
	public List<FileDTO> selectList(int num) throws Exception	{
		return sqlSession.selectList(NAMESPACE+"selectList", num);
	}
	
	public int insert(List<FileDTO> list) throws Exception{
		return sqlSession.insert(NAMESPACE+"fileInsert", list);
	}
}
