package com.five.ware;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SampleController {

	@RequestMapping(value="/")
	public String humanplus(){
<<<<<<< HEAD
<<<<<<< HEAD
		return "sample2";
	return "human/positionPlus";
}

	}*/
=======
		/*return "sample2";*/
		return "human/positionPlus";
	}
	
	
>>>>>>> 0220c8c1439b779c5dd3b619457a3d3a257ceb59

	
	@RequestMapping(value="/notice/notice")
	public String notice(){
		return "notice/notice";
	}
}
