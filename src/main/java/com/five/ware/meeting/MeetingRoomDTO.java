package com.five.ware.meeting;

public class MeetingRoomDTO {
	private String meetingId;
	private String meetingName;
	private String reservDate;
	private String reservStartTime;
	private String reservEndTime;
	private int eventId;
	
	
	public int getEventId() {
		return eventId;
	}
	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	public String getMeetingId() {
		return meetingId;
	}
	public void setMeetingId(String meetingId) {
		this.meetingId = meetingId;
	}
	public String getMeetingName() {
		return meetingName;
	}
	public void setMeetingName(String meetingName) {
		this.meetingName = meetingName;
	}
	public String getReservDate() {
		return reservDate;
	}
	public void setReservDate(String reservDate) {
		this.reservDate = reservDate;
	}
	public String getReservStartTime() {
		return reservStartTime;
	}
	public void setReservStartTime(String reservStartTime) {
		this.reservStartTime = reservStartTime;
	}
	public String getReservEndTime() {
		return reservEndTime;
	}
	public void setReservEndTime(String reservEndTime) {
		this.reservEndTime = reservEndTime;
	}
}
