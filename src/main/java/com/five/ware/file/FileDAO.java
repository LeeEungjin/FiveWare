package com.five.ware.file;

import javax.inject.Inject;
import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class FileDAO {
	
	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="fileMapper.";
	
	
	public int getFnum() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getFnum");
	}
	
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
