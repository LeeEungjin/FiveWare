package com.five.ware;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HumanController {

	@RequestMapping(value="/")
	public String humanplus(){
		return "sample2";
	}
}
