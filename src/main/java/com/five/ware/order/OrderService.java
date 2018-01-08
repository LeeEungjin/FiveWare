package com.five.ware.order;

import java.util.List;

import javax.inject.Inject;

import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.five.ware.product.ProductDTO;

@Transactional
@Service
public class OrderService {

	@Inject
	private OrderDAO orderDAO;
	
	public int insert(OrderDTO orderDTO)throws Exception{
		int result=orderDAO.insert(orderDTO);
		
		return result;
	}
	
	public int insert(OrderProductDTO orderProductDTO)throws Exception{
		int result=orderDAO.insert(orderProductDTO);
		
		return result;
	}
	
	public List<OrderDTO> selectList()throws Exception{
		List<OrderDTO> ar=orderDAO.selectList();
		
		return ar;
	}
	
	public List<ProductDTO> productList()throws Exception{
		List<ProductDTO> ar=orderDAO.productList();
		
		return ar;
	}
	
	public OrderDTO selectOne(String orderCode)throws Exception{
		OrderDTO orderDTO=orderDAO.selectOne(orderCode);
		
		return orderDTO;
	}
	
	public List<OrderProductDTO> orderProductList(String orderCode)throws Exception{
		List<OrderProductDTO> ar=orderDAO.orderProductList(orderCode);
		
		return ar;
	}
	
	public int delete(String orderCode)throws Exception{
		int result=orderDAO.delete(orderCode);
		
		return result;
	}
	
}
