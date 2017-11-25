package com.ninerevents.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ninerevents.model.Event;

/*
 * A class containing logic related to the events
 * */

public interface EventsService {
	
	public Map<Date, List<Event>> upcomingEvents();
	public Event eventDetail(String id);
	//THis list of events will come from DAO layer (via service layer).
}
