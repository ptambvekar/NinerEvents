package com.ninerevents.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.ninerevents.model.Event;
import com.ninerevents.utils.EventDetailMapper;
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
	

	public Event EventDetails(String id) {
		String SQL = "SELECT e.event_name,e.description,e.event_date,e.start_time,p.first_name,p.last_name, p.email_address,v.venue_name,pp.phone_no from Event e inner join Venue v on e.venue_id = v.id " + 
				"inner join person p on e.host_id = p.id " + 
				"inner join personphone pp on p.id = pp.person_id where e.id = 2";
		jdbcTemplateObject = new JdbcTemplate(dataSource);
		Event eventDetail = jdbcTemplateObject.queryForObject(SQL, new EventDetailMapper());
		return eventDetail;
	}

	

}