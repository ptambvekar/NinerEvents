package com.ninerevents.model;

import java.sql.Time;
import java.time.LocalDate;
import java.util.Date;

public class Event {

	
	private int eventId;
	private String eventName;
	private String eventDescription;
	private String eventCategory;
	private String venue_name;
	private String first_name;
	private String last_name;
	private String email_address;
	private String phone_no;
	private Date event_date;
	private Time start_time;
	private Time end_time;
	private String day_of_week;
	
	public int getEventId() {
		return eventId;
	}
	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getEventDescription() {
		return eventDescription;
	}
	
	public void setfirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getfirst_name() {
		return first_name;
	}
	
	public void setlast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getlast_name() {
		return last_name;
	}
	
	public void setemail_address(String email_address) {
		this.email_address = email_address;
	}
	public String getemail_address() {
		return email_address;
	}
	
	public void setphone_number(String phone_no) {
		this.phone_no = phone_no;
	}
	public String getphone_number() {
		return phone_no;
	}
	
	public void setEventDescription(String eventDescription) {
		this.eventDescription = eventDescription;
	}
	public String getEventCategory() {
		return eventCategory;
	}
	public void setEventCategory(String eventCategory) {
		this.eventCategory = eventCategory;
	}
	
	public void setvenue_name(String venue_name) {
		this.venue_name = venue_name;
	}
	
	public String getvenue_name() {
		return venue_name;
	}
	public Date getEvent_date() {
		return event_date;
	}
	public void setEvent_date(Date event_date) {
		this.event_date = event_date;
	}
	public Time getStart_time() {
		return start_time;
	}
	public void setStart_time(Time start_time) {
		this.start_time = start_time;
	}
	public Time getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Time end_time) {
		this.end_time = end_time;
	}
	public String getDay_of_week() {
		return day_of_week;
	}
	public void setDay_of_week(String day_of_week) {
		this.day_of_week = day_of_week;
	}
	
	
	
}
