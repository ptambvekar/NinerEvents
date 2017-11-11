package com.ninerevents.controllers;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;

import com.ninerevents.model.Event;


/*
* This is a controller that communicates with the UI.
* */


@Controller
@Path(value="/")
public class EventController {

	@Path(value="upcomingEvents")
	@Produces(MediaType.APPLICATION_JSON)
	@GET
	public Map<LocalDate, List<Event>> upcomingEvents(){

		//creation of this map will be in service layer
		Map<LocalDate, List<Event>> eventsMap = new HashMap<LocalDate,List<Event>>();

		//THis list of events will come from DAO layer (via service layer).
		List <Event> eventsList1= new ArrayList<Event>(); 
		List <Event> eventsList2= new ArrayList<Event>();
		Event e1= new Event();
		e1.setEventId(1);
		e1.setEventName("Lunch & Learn");
		e1.setEventDescription("Free Food");
		Event e2= new Event();
		e2.setEventId(2);
		e2.setEventName("CCI Career Fair");
		e2.setEventDescription("Only for undergrads");
		eventsList1.add(e1);
		eventsList2.add(e2);
		eventsMap.put(LocalDate.now(),eventsList1);
		eventsMap.put(LocalDate.now().plusDays(1),eventsList2);
		
		
		return eventsMap;
	}
}
