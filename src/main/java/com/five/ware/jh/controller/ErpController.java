package com.five.ware.jh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="erp/foundation/**")
public class ErpController {
	
	@RequestMapping(value="menuRegist", method=RequestMethod.GET)
	public void menuRegist(){}
	
	@RequestMapping(value="storageRegist", method=RequestMethod.GET)
	public void storageRegist(){}
}
