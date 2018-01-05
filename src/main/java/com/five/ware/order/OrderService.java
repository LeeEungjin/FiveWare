package com.five.ware.order;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class OrderService {

	@Inject
	private OrderDAO orderDAO;
	
	public int insert(OrderDTO orderDTO)throws Exception{
		int result=orderDAO.insert(orderDTO);
		
		return result;
	}
	
	public List<OrderDTO> selectList()throws Exception{
		List<OrderDTO> ar=orderDAO.selectList();
		
		return ar;
	}
	
	public OrderDTO selectOne(String orderCode)throws Exception{
		OrderDTO orderDTO=orderDAO.selectOne(orderCode);
		
		return orderDTO;
	}
	
	public int delete(String orderCode)throws Exception{
		int result=orderDAO.delete(orderCode);
		
		return result;
	}
	
}
