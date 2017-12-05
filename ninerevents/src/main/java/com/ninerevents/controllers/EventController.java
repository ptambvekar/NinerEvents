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
import com.ninerevents.model.EventName;
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
	public Map<String, List<Event>> upcomingEvents(){		
		//creation of this map will be in service layer
		Map<String, List<Event>> eventsMap = service.upcomingEvents();
		
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
	
	@Path(value="eventNames")
	@Produces(MediaType.APPLICATION_JSON)
	@GET
	public List<EventName> eventNames(){
		//creation of this list will be in service layer
		List<EventName> eventsList = service.getEventNames();
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
	public int registerEvent(Event event){		
		//creation of this list will be in service layer
		
		
		String id = service.checkPerson(event);
		
		if(id==null) {// error in accessing the database
			return -1;
		}
		else if(!"notfound".equals(id)) {
			int returncode=service.registerEvent(event);
			if(returncode>0)
				return returncode; //when user exists and they are successfully registerted to the event.
			if(returncode==-1)
				return returncode; //the user is already registered to this event.
			return -2;// error in accessing the database
		}
		else {
			return 0;	//when the user needs to register first
		}
		
	}
	
	@POST
	@Path(value="searchresults")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public List<CalendarEvent> searchEvents(SearchRequest request){		
		
		return service.getSearchResults(request);
	}
	
	//create the person and then register the event 
	@POST
	@Path(value="registerPerson")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public int registerperson(Event event){		
		//creation of this list will be in service layer
		
		int regPerson=service.registerPerson(event);
		int returncode=-1;
		if(regPerson>0) {
			returncode=service.registerEvent(event);
			if(returncode>0)
				return returncode;	//person registered successfully
			if(returncode==-1)
				return returncode; //the user is already registered to this event.
			return -2;			// error in registering the person to the event.
		}
		else {
			return -3; //error in creating the person.
		}
		
	}
	
	@Path(value="Feedback")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	@POST
	public int eventFeedback(Event event){		
		//creation of this list will be in service layer
		return service.eventFeedback(event);
	}
	
}
