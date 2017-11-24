package com.ninerevents.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ninerevents.model.CalendarEvent;
import com.ninerevents.model.Event;

/*
 * A class containing logic related to the events
 * */

public interface EventsService {
	
	public Map<Date, List<Event>> upcomingEvents();
	//THis list of events will come from DAO layer (via service layer).
	public List<CalendarEvent> getMonthlyEvents(Date startDate, Date endDate);
}
