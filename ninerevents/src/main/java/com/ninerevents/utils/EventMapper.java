package com.ninerevents.utils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.jdbc.core.RowMapper;

import com.ninerevents.model.Event;



public class EventMapper implements RowMapper<Event>
{
    public Event mapRow(ResultSet rs,int rowNum) throws SQLException
    {
    	Event event=new Event();
    	event.setEventId(rs.getInt("id"));
    	event.setEventName(rs.getString("event_name"));
    	event.setEventDescription(rs.getString("description"));
    	event.setStartDateTime(rs.getTimestamp("event_start"));
    	event.setEndDateTime(rs.getTimestamp("event_end"));

        return event;
        
      
    }
}