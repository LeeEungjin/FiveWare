package com.five.ware.eung.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="erp/foundation/**")
public class ErpFoundationController {

	@RequestMapping(value="supplier", method=RequestMethod.GET)
	public void account() {	}
}
