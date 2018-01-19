package com.five.ware.storeSales;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class StoreSalesDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="storeSalesMapper.";
	
	
	//insert
	public int insert(StoreSalesDTO storeSalesDTO)throws Exception{
		int result=sqlSession.insert(namespace+"insert", storeSalesDTO);
		return result;
	}

}
