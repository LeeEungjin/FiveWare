package com.five.ware.community;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BladkListDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="blackListMapper.";
	
	public int insert(BlackListDTO blackListDTO)throws Exception{
		return sqlSession.insert(namespace+"blackListInsert", blackListDTO);
	}
	
	public int update(int num)throws Exception{
		return sqlSession.update(namespace+"blackListUpdate", num);
	}
	
	public int reportCount(int num)throws Exception{
		return sqlSession.selectOne(namespace+"reportCount", num);
	}
	
}
