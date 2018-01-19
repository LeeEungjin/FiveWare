package com.five.ware.jh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.order.GraphService;

@Controller
@RequestMapping(value="erp/order/graph/**")
public class GraphController {
	
	@Autowired
	private GraphService graphService;
	
	@RequestMapping(value="orderGraph")
	public ModelAndView graph()throws Exception{
		ModelAndView mv=null;
		
		mv=graphService.amountGraph();
		
		mv.setViewName("erp/order/orderGraph");
		
		return mv;
	}
	
}
