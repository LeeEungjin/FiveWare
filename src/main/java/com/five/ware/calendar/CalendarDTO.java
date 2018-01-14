package com.five.ware.calendar;

public class CalendarDTO {
	
	private String calendarId;
	private String title;
	
	
	public String getCalendarId() {
		return calendarId;
	}
	public void setCalendarId(String calendarId) {
		this.calendarId = calendarId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Override
    public String toString() {
        return "CalendarDTO [calendarId=" + calendarId + ", title=" + title + "]";
    }

}
