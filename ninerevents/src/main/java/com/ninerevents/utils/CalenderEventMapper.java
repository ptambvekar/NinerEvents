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
    	event.setStart(rs.getDate("event_date").toString());
    	event.setEnd(rs.getDate("event_date").toString());
    	event.setUrl("");
        return event;
    }
}
