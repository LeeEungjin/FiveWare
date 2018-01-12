package com.five.ware.eung.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/erp/calendar/**")
public class CalendarController {

	@RequestMapping(value="calendarView", method=RequestMethod.GET)
	public void goCalendar() { }
}
