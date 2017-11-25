package com.ninerevents.controllers;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ninerevents.model.Event;
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
	
	@Path(value="eventDetail")
	@Produces(MediaType.APPLICATION_JSON)
	@GET
	public Event eventDetail(@QueryParam("event_id") String id  ){		
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
	
	

}
