package com.ninerevents.dao;

import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.ninerevents.model.CalendarEvent;
import com.ninerevents.model.Event;
import com.ninerevents.utils.CalenderEventMapper;
import com.ninerevents.utils.EventMapper;

public class EventDAOImpl implements EventDAO {
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public List<Event> listEvents() {
		String SQL = "SELECT * FROM Event WHERE event_date IN (SELECT * FROM ( SELECT DISTINCT event_date FROM Event WHERE event_date > CURDATE( ) ORDER BY event_date LIMIT 3) AS t)";
		jdbcTemplateObject = new JdbcTemplate(dataSource);
		List<Event> events = jdbcTemplateObject.query(SQL, new EventMapper());
		return events;
	}

	
	public List<CalendarEvent> getMonthlyEvents(Date startDate, Date endDate) {
		String SQL = "select * from event where event_date between ? and ?";
		jdbcTemplateObject = new JdbcTemplate(dataSource);
		List<CalendarEvent> events = jdbcTemplateObject.query(SQL, new Object[] {startDate,endDate},new CalenderEventMapper());
		return events;
	}
}