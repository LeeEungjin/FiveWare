package com.five.ware;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.five.ware.map.MapService;

@Controller
@RequestMapping(value="/map/*")
public class MapController {
	
	@Autowired
	private MapService mapService;
	
	@RequestMapping(value="mapList")
	public ModelAndView mapList(Model model)throws Exception{
		
		ModelAndView mv=mapService.mapList(model);
		mv.setViewName("srm/store/allStoreInfo");
		
		return mv;
	}

}
