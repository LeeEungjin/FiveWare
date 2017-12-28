package com.five.ware;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErpController {
	
	@RequestMapping(value="memuRegist")
	public String menuRegist(){
		return "erp/memuRegist";
	}


 }


