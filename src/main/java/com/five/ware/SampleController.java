package com.five.ware;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SampleController {

	@RequestMapping(value="/")
	public String humanplus(){
		/*return "sample2";*/

	return "human/basisInfo/salPlus";
	}

	
	@RequestMapping(value="/notice/notice")
	public String notice(){
		return "notice/notice";
	}
}
