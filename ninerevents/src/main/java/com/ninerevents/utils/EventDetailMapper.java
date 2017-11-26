package com.ninerevents.utils;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.ninerevents.model.Event;

public class EventDetailMapper implements RowMapper<Event>{
	
	  public Event mapRow(ResultSet rs,int rowNum) throws SQLException
	    {
	    	Event event=new Event();
	    	event.setEventName(rs.getString("event_name"));
	    	event.setStartDateTime(rs.getTimestamp("event_start"));
	    	event.setEndDateTime(rs.getTimestamp("event_end"));
	    	event.setEventDescription(rs.getString("description"));
	    	event.setEmail_address(rs.getString("email_address"));
	    	event.setFirst_name(rs.getString("first_name"));
	    	event.setLast_name(rs.getString("last_name"));
	    	event.setPhone_no(rs.getString("phone_no"));
	    	event.setVenue_name(rs.getString("venue_name"));

	        return event;
	        
	      
	    }

	

}
