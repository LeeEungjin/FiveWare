package com.five.ware.jh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.order.OrderService;

@Controller
@RequestMapping(value="erp/order/**")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="orderRegist")
	public ModelAndView orderRegist(ModelAndView mv){
		try {
			mv.addObject("orderList", orderService.selectList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName("erp/order/orderRegist");
		
		return mv;
	}
	
}
