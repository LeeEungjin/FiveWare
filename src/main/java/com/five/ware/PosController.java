package com.five.ware;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/pos/**")
public class PosController {

	@RequestMapping(value="pos")
	public String pos(){
		return "pos";
	}
}
