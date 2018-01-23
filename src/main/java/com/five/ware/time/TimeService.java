package com.five.ware.time;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;



@Service
public class TimeService {
	
	
	@Inject
	private TimeDAO timeDAO;
	
	
	
	public ModelAndView selectOneList(String memberCode)throws Exception{
		ModelAndView mv=new ModelAndView();
		
		List<TimeDTO> ar=new ArrayList<TimeDTO>();
		
		ar=timeDAO.selectOneList(memberCode);
		JSONArray json = new JSONArray(); // []


		
		
		for(TimeDTO timeDTO :ar){
			JSONObject obj = new JSONObject();
			obj.put("start", timeDTO.getRegdate());
			obj.put("title", "출근 "+timeDTO.getStartTime()); // [{},{}]
			json.add(obj);
		}
		
		
		for(TimeDTO timeDTO :ar){
				JSONObject obj = new JSONObject();
				obj.put("start", timeDTO.getRegdate());
			if(timeDTO.getLastTime()==null){
				obj.put("title", "퇴근 처리 X");
			}else{
				obj.put("title", "퇴근 "+timeDTO.getLastTime()); // [{},{}]
			}
				json.add(obj);
		}
		
	

		
		mv.addObject("list", json);

		
		
		return mv;
	}
	
	
	//selectOne
	public TimeDTO selectOne(TimeDTO timeDTO) throws Exception{
		timeDTO=timeDAO.selectOne(timeDTO);
		
		return timeDTO;
	}
	
	//update
	public int update(TimeDTO timeDTO)throws Exception{
		int result=timeDAO.update(timeDTO);
		
		return result;
	}
	
	//insert
	public int insert(TimeDTO timeDTO)throws Exception{
		int result=timeDAO.insert(timeDTO);
		
		return result;
		
	}

}
