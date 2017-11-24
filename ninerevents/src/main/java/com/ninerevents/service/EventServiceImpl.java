package com.ninerevents.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ninerevents.dao.EventDAO;
import com.ninerevents.model.CalendarEvent;
import com.ninerevents.model.Event;

@Service
public class EventServiceImpl implements EventsService{

	@Autowired
	EventDAO eventJDBCTemplate;
	@Override
	public Map<Date, List<Event>> upcomingEvents() {

		Map<Date, List<Event>> eventsMap = new HashMap<Date,List<Event>>();
		
		List <Event> eventsList= new ArrayList<Event>();
		Event e1= new Event();
		eventsList = eventJDBCTemplate.listEvents();
		//logic to seperate the list by event-date.
		for(Event e:eventsList) {
			Date eventDate=e.getEvent_date();
			if(!eventsMap.containsKey(eventDate)) {
				List <Event> eventsList1= new ArrayList<Event>();
				eventsList1.add(e);
				eventsMap.put(eventDate, eventsList1);
			}
			else {
				eventsMap.get(eventDate).add(e);
			}
		}
		return eventsMap;
	}
	
	public List<CalendarEvent> getMonthlyEvents(Date startDate, Date endDate){
		
		return eventJDBCTemplate.getMonthlyEvents(startDate,endDate);
		
		
	}

	
}
