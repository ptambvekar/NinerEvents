package com.ninerevents.model;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CalendarEvent {
	
	String id;
	String title;
	String allDay;
	@JsonFormat(pattern="dd MMM Y HH:MM:ss")
	String start;
	@JsonFormat(pattern="dd MMM Y HH:MM:ss")
	String end;
	
	String url;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAllDay() {
		return allDay;
	}
	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

}
