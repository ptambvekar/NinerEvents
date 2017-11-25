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
    	event.setEvent_date(rs.getDate("event_date"));
    	event.setStart_time(rs.getTime("start_time"));
    	event.setEnd_time(rs.getTime("end_time"));
    	event.setDay_of_week(rs.getString("day_of_week"));
    	event.setEventDescription(rs.getString("description"));
    	

        return event;
        
      
    }
}