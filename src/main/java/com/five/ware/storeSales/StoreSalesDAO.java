package com.five.ware.storeSales;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class StoreSalesDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="storeSalesMapper.";
	
	//시퀀스
	public int getNum()throws Exception{
		
		return sqlSession.selectOne(namespace+"getNum");
	}
	
	//selectOne
	public List<StoreSalesDTO> selectOne(int num)throws Exception{
		return sqlSession.selectList(namespace+"selectOne", num);
	}
	
	//list
	public List<StoreSalesDTO> selectList(StoreSalesDTO storeSalesDTO)throws Exception{
		return sqlSession.selectList(namespace+"selectList", storeSalesDTO);
	}
	
	//insert
	public int insert(StoreSalesDTO storeSalesDTO)throws Exception{
		int result=sqlSession.insert(namespace+"insert", storeSalesDTO);
		return result;
	}

}
