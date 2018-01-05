package com.five.ware.eb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/erp/**")
public class StoreSalesController {

	@RequestMapping(value="storeSales")
	public String storeSales() throws Exception{
		
		return "/erp/account/storeSales";
	}
}
