package com.five.ware.order;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class GraphDAO {
	
	@Inject
	SqlSession sqlSession;
	private static final String NAMESPACE="orderGraphMapper.";
	
	public int codeCount()throws Exception{
		return sqlSession.selectOne(NAMESPACE+"codeCount");
	}
	
	public List<OrderProductDTO> selectList()throws Exception{
		return sqlSession.selectList(NAMESPACE+"selectList");
	}
	
	public List<String> codeList()throws Exception{
		return sqlSession.selectList(NAMESPACE+"codeList");
	}
	
	public int amoutSum(String code)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"amountSum", code);
	}
	
	public int priceSum(String code)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"priceSum", code);
	}
	
	public Double amountAvg(String code)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"amountAvg", code);
	}
	
	public Double priceAvg(String code)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"priceAvg", code);
	}
}
