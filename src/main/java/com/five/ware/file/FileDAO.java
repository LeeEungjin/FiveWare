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
	
	public int fileInsert(FileDTO fileDTO) throws Exception{
      int result = sqlSession.insert(NAMESPACE+"fileInsert", fileDTO);
      
      return result;
    }
	   
   public FileDTO fileOne(String code) throws Exception{
      FileDTO fileDTO = sqlSession.selectOne(NAMESPACE+"fileOne",code);
      
      return fileDTO;
   }
	
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
