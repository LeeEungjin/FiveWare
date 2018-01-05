package com.five.ware.jh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.RequestMethod;
import com.five.ware.order.OrderDTO;
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
	
	
	@RequestMapping(value="orderWrite",method=RequestMethod.POST)
	public String orderWrite(RedirectAttributes rd, OrderDTO orderDTO){
		int result=0;
		String message="Fail";
		
		try {
			result=orderService.insert(orderDTO);
			if(result>0){
				message="Success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		rd.addFlashAttribute("message",message);
		
		return "redirect:./orderRegist";
	}
}
