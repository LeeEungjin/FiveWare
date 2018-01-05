package com.five.ware.file;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAO {
	
@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="fileMapper.";
	
	public int fileInsert(FileDTO fileDTO) throws Exception{
		int result = sqlSession.insert(NAMESPACE+"fileInsert", fileDTO);
		
		return result;
	}
	
	public FileDTO fileOne(String code) throws Exception{
		FileDTO fileDTO = sqlSession.selectOne(NAMESPACE+"fileOne",code);
		
		return fileDTO;
	}

}
