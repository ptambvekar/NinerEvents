package com.ninerevents.controllers;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ninerevents.model.CalendarEvent;
import com.ninerevents.model.CalendarEventsRequest;
import com.ninerevents.model.Event;
import com.ninerevents.model.EventCategory;
import com.ninerevents.model.EventLocation;
import com.ninerevents.model.SearchRequest;
import com.ninerevents.service.EventsService;


/*
* This is a controller that communicates with the UI.
* */

@Component
@Path(value="/event")
public class EventController {

	@Autowired
	EventsService service;

	@Path(value="upcomingEvents")
	@Produces(MediaType.APPLICATION_JSON)
	@GET
	public Map<Date, List<Event>> upcomingEvents(){		
		//creation of this map will be in service layer
		Map<Date, List<Event>> eventsMap = service.upcomingEvents();
		
		return eventsMap;
	}
	

	@Path(value="/monthlyEvents")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@POST
	public Response monthlyEvents(CalendarEventsRequest request){	
		
		return Response.ok(service.getMonthlyEvents(request.getStartDate(), request.getEndDate())).build();
		
	}

	
	@Path(value="eventDetail")
	@Produces(MediaType.APPLICATION_JSON)
	@GET
	public Event eventDetail(@QueryParam("event") String id  ){		
		//creation of this map will be in service layer
		Event eventDetail = service.eventDetail(id);
		
		return eventDetail;
	}
	

	@Path(value="importantEvents")
	@Produces(MediaType.APPLICATION_JSON)
	@GET
	public List<Event> importantEvents(){		
		//creation of this list will be in service layer
		List<Event> eventsList = service.importantEvents();
		return eventsList;
	}
	
	@Path(value="featuredEvents")
	@Produces(MediaType.APPLICATION_JSON)
	@GET
	public List<Event> featuredEvents(){		
		//creation of this list will be in service layer
		List<Event> eventsList = service.featuredEvents();
		return eventsList;
	}
	
	@Path(value="addEvent")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)	
	@POST
	public void addEvent(Event event){		
		//creation of this list will be in service layer
		service.addEvent(event);
	}
	
	@Path(value="eventLocations")
	@Produces(MediaType.APPLICATION_JSON)
	@GET
	public List<EventLocation> getLocations(){		
		//creation of this list will be in service layer
		List<EventLocation> eventsList = service.getEventLocations();
		return eventsList;
	}
	
	@Path(value="eventTypes")
	@Produces(MediaType.APPLICATION_JSON)
	@GET
	public List<EventCategory> getEventTypes(){		
		//creation of this list will be in service layer
		List<EventCategory> eventsList = service.getEventTypes();
		return eventsList;
	}
	
	@POST
	@Path(value="registerEvent")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public void registerEvent(Event event){		
		//creation of this list will be in service layer

	}

	@POST
	@Path(value="searchresults")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public List<CalendarEvent> searchEvents(SearchRequest request){		
		
		return service.getSearchResults(request);
	}
	
}
