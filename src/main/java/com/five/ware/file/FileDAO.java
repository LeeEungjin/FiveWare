package com.five.ware.file;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class FileDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="fileMapper.";
	
	public int insert(FileDTO fileDTO) {
		return sqlSession.insert(NAMESPACE+"fileInsert", fileDTO);
	}

}
