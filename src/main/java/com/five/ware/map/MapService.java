package com.five.ware.map;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;


@Service
public class MapService {
	
	@Inject
	private MapDAO mapDAO;
	
	public ModelAndView mapList(Model model)throws Exception{
		ModelAndView mv=new ModelAndView();
		List<String> mapList=new ArrayList<String>();
		Float [] geo=null;
		List<Float []> geoList=new ArrayList<Float[]>();
		
		mapList=mapDAO.mapList();
		
		for (String location : mapList) {
			geo=mapDAO.geoCoding(location);
			
			geoList.add(geo);
		}
		
		/*mv.addObject("mapList", mapList);*/
		mv.addObject("geoList", geoList);
		
		//JSON
		JsonArray ar = new JsonArray();
		
		
		for(int i=0; i<geoList.size();i++){
			JsonObject obj = new JsonObject();
			
			System.out.println(geoList.get(i)[0]);
			System.out.println(geoList.get(i)[1]);
			
			obj.addProperty("lat", geoList.get(i)[0]);
			obj.addProperty("lng", geoList.get(i)[1]);
			ar.add(obj);
		}
		mv.addObject("json", ar);
		return mv;
	}

}
