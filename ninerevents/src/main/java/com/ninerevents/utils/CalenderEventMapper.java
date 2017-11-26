package com.ninerevents.utils;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.ninerevents.model.CalendarEvent;
import com.ninerevents.model.Event;

public class CalenderEventMapper implements RowMapper<CalendarEvent>
{
    public CalendarEvent mapRow(ResultSet rs,int rowNum) throws SQLException
    {
    	CalendarEvent event=new CalendarEvent();
    	event.setId(rs.getString("id"));
    	event.setTitle(rs.getString("event_name"));
    	event.setStart(rs.getTimestamp("event_start").toString());
    	event.setEnd(rs.getTimestamp("event_end").toString());
    	event.setUrl("");
        return event;
    }
}
