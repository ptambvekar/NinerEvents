package com.ninerevents.dao;

import java.util.Date;

/*
 * This class should act as a DAO for the Events related data. 
 * */

import java.util.List;

import javax.sql.DataSource;

import com.ninerevents.model.CalendarEvent;
import com.ninerevents.model.Event;
import com.ninerevents.model.EventCategory;
import com.ninerevents.model.EventLocation;
import com.ninerevents.model.EventName;
import com.ninerevents.model.SearchRequest;

public interface EventDAO {

	/**
	 * This is the method to be used to initialize database resources ie.
	 * connection.
	 */
	public void setDataSource(DataSource ds);

	/**
	 * This is the method to be used to list down all the records from the Event
	 * table.
	 */

	public List<Event> listEvents();

	public List<CalendarEvent> getMonthlyEvents(Date startDate, Date endDate);

	public List<Event> listImpEvents();

	public List<Event> listFeaturedEvents();

	public void insertEvents(Event event);
	
	public Event EventDetails(String id); 

	/* method to populate drop-downs */ 
	public List<EventLocation> getEventLocations();
	
	public List<EventCategory> getEventType();
	
	public List<EventName> getEventName();

	public List<CalendarEvent> getSearchResults(String keyword,String location,String category);

	public int registerEvents(Event event);
	
	public String checkPerson(Event event);
	
	public int registerNewPerson(Event event);
	
	public int insertFeedback(Event event);
	
}
