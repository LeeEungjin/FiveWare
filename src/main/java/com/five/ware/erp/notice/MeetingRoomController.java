package com.five.ware.erp.notice;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value="/meetingRoom/*")
public class MeetingRoomController {

	@Inject
	private MeetingRoomService meetingRoomService;
	
	//insert
	@RequestMapping(value="meetingRoom", method=RequestMethod.GET)
	public String insert() throws Exception	{
		return "meetingRoom/meetingRoom";
	}
	
	//insert
	@RequestMapping(value="meetingRoom", method=RequestMethod.POST)
	public String insert(MeetingRoomDTO meetingRoomDTO, RedirectAttributes rd) throws Exception	{
		int result = 0;
		try {
			result = meetingRoomService.insert(meetingRoomDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String message="FAIL";
		if(result>0)	{
			message = "SUCCESS";
		}
		rd.addFlashAttribute("message", message);
		
		return "redirect:meetingRoom";
	}
}
