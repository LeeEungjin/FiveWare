package com.five.ware;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/erp/**")
public class ErpController {
	
	@RequestMapping(value="menuRegist")
	public String menuRegist(){
		return "erp/menuRegist";
	}
<<<<<<< HEAD
}
=======


 }

>>>>>>> arin
