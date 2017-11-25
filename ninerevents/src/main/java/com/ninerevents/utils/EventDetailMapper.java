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
	    	event.setEvent_date(rs.getDate("event_date"));
	    	event.setStart_time(rs.getTime("start_time"));
	    	event.setEventDescription(rs.getString("description"));
	    	event.setemail_address(rs.getString("email_address"));
	    	event.setfirst_name(rs.getString("first_name"));
	    	event.setlast_name(rs.getString("last_name"));
	    	event.setphone_number(rs.getString("phone_no"));
	    	event.setvenue_name(rs.getString("venue_name"));

	        return event;
	        
	      
	    }

	

}
