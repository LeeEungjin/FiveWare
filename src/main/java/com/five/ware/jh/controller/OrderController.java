package com.five.ware.jh.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.five.ware.order.OrderDTO;
import com.five.ware.order.OrderProductDTO;
import com.five.ware.order.OrderService;
import com.five.ware.erp.product.ProductDTO;

@Controller
@RequestMapping(value="erp/order/**")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="orderDelete")
	public String delete(RedirectAttributes rd, String orderCode){
		String message="Fail";
		int result=0;
		
		try {
			result=orderService.delete(orderCode);
			if(result>0){
				message="Success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:./orderRegist";
	}
	
	@RequestMapping(value="orderRegist")
	public ModelAndView orderRegist(){
		ModelAndView mv=new ModelAndView();
		
		try {
			mv.addObject("orderList", orderService.selectList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName("erp/order/orderRegist");
		
		return mv;
	}
	
	@RequestMapping(value="productList")
	public ModelAndView productList(){
		ModelAndView mv=new ModelAndView();
		
		try {
			mv.addObject("productList", orderService.productList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName("erp/order/productList");
		
		return mv;
	}
	
	@RequestMapping(value="orderView", method=RequestMethod.GET)
	public ModelAndView selectOne(String orderCode){
		ModelAndView mv=new ModelAndView();
		try {
			mv.addObject("orderDTO", orderService.selectOne(orderCode));
			mv.addObject("productList", orderService.orderProductList(orderCode));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName("erp/order/orderView");
		
		return mv;
	}
	
	@RequestMapping(value="orderWrite",method=RequestMethod.POST)
	public String orderWrite(RedirectAttributes rd, OrderDTO orderDTO, String [] code, int [] amount, int [] price){
		int result=0;
		String message="Fail";
		String orderCode=orderDTO.getOrderCode();
		OrderProductDTO orderProductDTO=new OrderProductDTO();
		
		try {
			result=orderService.insert(orderDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for(int i=0; i<code.length; i++){
			orderProductDTO.setOrderCode(orderCode);
			orderProductDTO.setCode(code[i]);
			orderProductDTO.setAmount(amount[i]);
			orderProductDTO.setPrice(price[i]);
			
			try {
				result=orderService.insert(orderProductDTO);
				if(result>0){
					message="Success";
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		rd.addFlashAttribute("message",message);
		
		return "redirect:./orderRegist";
	}
	
	@RequestMapping(value="orderDateList")
	public ModelAndView materDateSerach(ModelAndView mv, String smaterDate, String ematerDate){

		try {
			mv.addObject("dateList", orderService.orderDateList(smaterDate, ematerDate));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName("erp/order/orderDateList");
		
		return mv;
	}
	

}
