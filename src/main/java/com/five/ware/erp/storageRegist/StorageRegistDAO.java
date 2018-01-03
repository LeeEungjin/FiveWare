package com.five.ware.erp.storageRegist;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.util.RowNum;

@Repository
public class StorageRegistDAO {
	
	@Inject 
	SqlSession sqlSession;
	private static final String namespace="storageRegistMapper.";
	
	public int insert(StorageRegistDTO storageRegistDTO)throws Exception{
		return sqlSession.insert(namespace+"insert", storageRegistDTO);
	}
	
	public List<StorageRegistDTO> selectList(RowNum rowNum)throws Exception{
		return sqlSession.selectList(namespace+"selectList", rowNum);
	}
	
	public int totalCount(RowNum rowNum )throws Exception{
		return sqlSession.selectOne(namespace+"totalCount", rowNum);
	}
	
	public StorageRegistDTO selectOne(String storageCode)throws Exception{
		return sqlSession.selectOne(namespace+"selectOne", storageCode);
	}
	
	public int update(StorageRegistDTO storageRegistDTO)throws Exception{
		return sqlSession.update(namespace+"update", storageRegistDTO);
	}
	
	public int delete(String storageCode)throws Exception{
		return sqlSession.delete(namespace+"delete", storageCode);
	}
}
