package com.five.ware.order;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {
	
	@Inject
	SqlSession sqlSession;
	private static final String namespace="orderMapper.";
	
	public int insert(OrderDTO orderDTO)throws Exception{
		return sqlSession.insert(namespace+"insert", orderDTO);
	}
	
	public List<OrderDTO> selectList()throws Exception{
		return sqlSession.selectList(namespace+"selectList");
	}
	
	public OrderDTO selectOne(String orderCode)throws Exception{
		return sqlSession.selectOne(namespace+"selectOne", orderCode);
	}
	
	public int delete(String orderCode)throws Exception{
		return sqlSession.delete(namespace+"delete", orderCode);
	}
}
