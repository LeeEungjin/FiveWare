package com.five.ware.eb.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.five.ware.time.TimeDTO;
import com.five.ware.time.TimeService;

@Controller
@RequestMapping(value="/time/**")
public class TimeController {

		@Inject
		private TimeService timeService;
		
		
		

		
		@RequestMapping(value="timeSelectOne" ,method=RequestMethod.GET)
		@ResponseBody
		public TimeDTO selectOne(TimeDTO timeDTO) throws Exception{

			timeDTO=timeService.selectOne(timeDTO);
			
			return timeDTO;
		}
		
		//update
		@RequestMapping(value="timeUpdate" ,method=RequestMethod.POST)
		@ResponseBody
		public String update(TimeDTO timeDTO)throws Exception{

			
			int result=timeService.update(timeDTO);
			
			String message="fail";
			if(result>0){
				message="success";
			}
			
			return message;
		}
		
		//insert
		@RequestMapping(value="timeInsert")
		@ResponseBody
		public String insert(TimeDTO timeDTO) throws Exception{
			
			int result=timeService.insert(timeDTO);
			
			String message="fail";
			if(result>0){
				message="success";
			}
			
			
			return message;
		}
}
