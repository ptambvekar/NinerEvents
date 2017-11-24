package com.ninerevents.controllers;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ninerevents.model.CalendarEvent;
import com.ninerevents.model.CalendarEventsRequest;
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
	
	
	@Path(value="/monthlyEvents")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@POST
	public Response monthlyEvents(CalendarEventsRequest request){	
		
		return Response.ok(service.getMonthlyEvents(request.getStartDate(), request.getEndDate())).build();
		
	}
}
