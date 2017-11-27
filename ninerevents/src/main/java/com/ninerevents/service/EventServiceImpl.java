package com.ninerevents.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysql.jdbc.StringUtils;
import com.ninerevents.dao.EventDAO;
import com.ninerevents.model.CalendarEvent;
import com.ninerevents.model.Event;
import com.ninerevents.model.EventCategory;
import com.ninerevents.model.EventLocation;
import com.ninerevents.model.SearchRequest;

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
			Date eventDate=e.getStartDateTime();
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


	public List<Event> importantEvents() {
		List <Event> eventsList= new ArrayList<Event>();
		eventsList = eventJDBCTemplate.listImpEvents();
		return eventsList;
		
	}
	
	public List<Event> featuredEvents() {
		List <Event> eventsList= new ArrayList<Event>();
		eventsList = eventJDBCTemplate.listFeaturedEvents();
		return eventsList;
		
	}


	public void addEvent(Event event) {
		eventJDBCTemplate.insertEvents(event);
	}

	@Override
	public Event eventDetail(String id) {
		
			return eventJDBCTemplate.EventDetails(id);
	
	}


	@Override
	public List<EventLocation> getEventLocations() {
		return eventJDBCTemplate.getEventLocations();
	}


	@Override
	public List<EventCategory> getEventTypes() {
		return eventJDBCTemplate.getEventType();
	}


	@Override
	public List<CalendarEvent> getSearchResults(SearchRequest request) {
		String location= "Any".equals(request.getEventLocation()) ? null:request.getEventLocation(); 
		String category= "Any".equals(request.getEventCategory()) ? null:request.getEventCategory();
		String keyword= request.getKeyword();
		if(StringUtils.isNullOrEmpty(keyword) || StringUtils.isEmptyOrWhitespaceOnly(keyword)) {
			
			return null;
		}
		
		return eventJDBCTemplate.getSearchResults(keyword,location,category);
	}


	@Override
	public int registerEvent(Event event) {
		// TODO Auto-generated method stub
		return eventJDBCTemplate.registerEvents(event);		
	}

	@Override
	public String checkPerson(Event event) {
		String id = eventJDBCTemplate.checkPerson(event);
		return id;
	}

	@Override
	public int registerPerson(Event event) {
		return eventJDBCTemplate.registerNewPerson(event);
	}

	
	
}
