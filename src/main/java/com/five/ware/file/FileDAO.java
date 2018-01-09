package com.five.ware.file;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class FileDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="fileMapper.";
	
	
	public int deleteOne(int fnum) throws Exception {
		return sqlSession.delete(NAMESPACE+"fileDeleteOne", fnum);
	}
	
	public List<FileDTO> selectList(String code) throws Exception {
		return sqlSession.selectList(NAMESPACE+"fileList", code);
	}
	
	public int delete(String code) throws Exception {
		return sqlSession.delete(NAMESPACE+"fileDelete", code);
	}
	
	public int insert(FileDTO fileDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"fileInsert", fileDTO);
	}

}
