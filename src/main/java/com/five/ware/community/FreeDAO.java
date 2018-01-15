package com.five.ware.community;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.util.RowNum;

@Repository
public class FreeDAO {
	
	@Inject
	SqlSession sqlSession;
	private static final String namespace="freeMapper.";
	
	public int totalCount(RowNum rowNum)throws Exception{
		return sqlSession.selectOne(namespace+"totalCount", rowNum);
	}
	
	public List<FreeDTO> selectList(RowNum rowNum)throws Exception{
		return sqlSession.selectList(namespace+"selectList", rowNum);
	}
	
	public int freeInsert(FreeDTO freeDTO)throws Exception{
		return sqlSession.insert(namespace+"freeInsert", freeDTO);
	}
	
	public int freeReply(FreeDTO freeDTO)throws Exception{
		return sqlSession.insert(namespace+"freeReply", freeDTO);
	}
	
	public int stepUpdate(FreeDTO freeDTO)throws Exception{
		return sqlSession.update(namespace+"stepUpdate", freeDTO);
	}
	
	public FreeDTO selectOne(int num)throws Exception{
		return sqlSession.selectOne(namespace+"selectOne", num);
	}
	
	public UploadDTO selectFile(int num)throws Exception{
		return sqlSession.selectOne(namespace+"selectFile", num);
	}
	
	public int delete(int num)throws Exception{
		return sqlSession.delete(namespace+"delete", num);
	}
	
	public int update(FreeDTO freeDTO)throws Exception{
		return sqlSession.update(namespace+"update", freeDTO);
	}
	
	public int hitUpdate(int num)throws Exception{
		return sqlSession.update(namespace+"hitUpdate", num);
	}

}
