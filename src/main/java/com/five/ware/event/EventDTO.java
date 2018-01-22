package com.five.ware.event;

import com.five.ware.community.NumFileDTO;

public class EventDTO extends NumFileDTO{
	
	private int eventNum;
	private String temp;
	private String eventName;
	private String eventOption;
	private String eventSdate;
	private String eventEdate;
	
	
	
	public int getEventNum() {
		return eventNum;
	}
	public void setEventNum(int eventNum) {
		this.eventNum = eventNum;
	}
	public String getTemp() {
		return temp;
	}
	public void setTemp(String temp) {
		this.temp = temp;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getEventOption() {
		return eventOption;
	}
	public void setEventOption(String eventOption) {
		this.eventOption = eventOption;
	}
	public String getEventSdate() {
		return eventSdate;
	}
	public void setEventSdate(String eventSdate) {
		this.eventSdate = eventSdate;
	}
	public String getEventEdate() {
		return eventEdate;
	}
	public void setEventEdate(String eventEdate) {
		this.eventEdate = eventEdate;
	}
	
	

}
