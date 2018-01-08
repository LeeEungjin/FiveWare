package com.five.ware.order;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.five.ware.product.ProductDTO;

@Repository
public class OrderDAO {
	
	@Inject
	SqlSession sqlSession;
	private static final String namespace="orderMapper.";
	
	public int insert(OrderDTO orderDTO)throws Exception{
		return sqlSession.insert(namespace+"insert", orderDTO);
	}
	
	public int insert(OrderProductDTO orderProductDTO)throws Exception{
		return sqlSession.insert(namespace+"productinsert", orderProductDTO);
	}
	
	public List<OrderDTO> selectList()throws Exception{
		return sqlSession.selectList(namespace+"selectList");
	}

	public List<ProductDTO> productList()throws Exception{
		return sqlSession.selectList(namespace+"productList");
	}
	
	public OrderDTO selectOne(String orderCode)throws Exception{
		return sqlSession.selectOne(namespace+"selectOne", orderCode);
	}
	
	public List<OrderProductDTO> orderProductList(String orderCode)throws Exception{
		return sqlSession.selectList(namespace+"orderProductList", orderCode);
	}
	
	public int delete(String orderCode)throws Exception{
		return sqlSession.delete(namespace+"delete", orderCode);
	}
}
