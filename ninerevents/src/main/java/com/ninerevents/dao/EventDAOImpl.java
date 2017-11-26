package com.ninerevents.dao;

import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.ninerevents.model.CalendarEvent;
import com.ninerevents.model.Event;
import com.ninerevents.model.EventCategory;
import com.ninerevents.model.EventLocation;
import com.ninerevents.utils.CalenderEventMapper;
import com.ninerevents.utils.EventDetailMapper;
import com.ninerevents.utils.EventMapper;

public class EventDAOImpl implements EventDAO {
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public List<Event> listEvents() {
		String SQL = "SELECT * FROM Event WHERE event_start IN (SELECT * FROM ( SELECT DISTINCT event_start FROM Event WHERE event_start > CURDATE( ) ORDER BY event_start LIMIT 3) AS t)";
		
		jdbcTemplateObject = new JdbcTemplate(dataSource);
		List<Event> events = jdbcTemplateObject.query(SQL, new EventMapper());
		return events;
	}
	

	public Event EventDetails(String id) {
		String SQL="SELECT e.event_name,e.description,e.event_start,e.event_end,p.first_name,p.last_name, p.email_address,v.venue_name,pp.phone_no from Event e inner join Venue v on e.venue_id = v.id inner join person p on e.host_id = p.id inner join personphone pp on p.id = pp.person_id where e.id =?";
		jdbcTemplateObject = new JdbcTemplate(dataSource);
		Event eventDetail = jdbcTemplateObject.queryForObject(SQL, new String[] {id},new EventDetailMapper());
		return eventDetail;
	}

	

	public List<Event> listImpEvents() {
		String SQL = "SELECT * FROM Event WHERE imp_flag = 'imp'";
		jdbcTemplateObject = new JdbcTemplate(dataSource);
		List<Event> events = jdbcTemplateObject.query(SQL, new EventMapper());
		return events;
	}
	
	public List<Event> listFeaturedEvents() {
		String SQL = "SELECT * FROM Event WHERE featured_flag = 'featured'";
		jdbcTemplateObject = new JdbcTemplate(dataSource);
		List<Event> events = jdbcTemplateObject.query(SQL, new EventMapper());
		return events;
	}
	
	public void insertEvents(Event event){
		
		String SQL = "INSERT INTO EVENT " +
			"(event_name, description, event_start, event_end) VALUES (?, ?, ?, ?)";


		jdbcTemplateObject.update(SQL, new Object[] { event.getEventName(),
			event.getEventDescription(), event.getStartDateTime(), event.getEndDateTime()
		});
	}


	public List<CalendarEvent> getMonthlyEvents(Date startDate, Date endDate) {
		String SQL = "select * from event where event_start between ? and ?";
		jdbcTemplateObject = new JdbcTemplate(dataSource);
		List<CalendarEvent> events = jdbcTemplateObject.query(SQL, new Object[] {startDate,endDate},new CalenderEventMapper());
		return events;
	}

	@Override
	public List<EventLocation> getEventLocations() {
		String SQL = "select t.id as id, t.venue_name as venueName from venue t";
		List<EventLocation> locations = jdbcTemplateObject.query(SQL, new BeanPropertyRowMapper(EventLocation.class));
		return locations;
	}

	@Override
	public List<EventCategory> getEventType() {
		String SQL = "select t.id as id, t.category_name as categoryName from category t";
		List<EventCategory> locations = jdbcTemplateObject.query(SQL, new BeanPropertyRowMapper(EventCategory.class));
		return locations;
	}

	@Override
	public List<CalendarEvent> getSearchResults(String keyword,String location, String category) {
		StringBuilder SQL = new StringBuilder("select * from event where event_name= '"+keyword+"'");
		if(location!=null) {
			SQL.append(" and venue_id="+location);
		}
		if(category!=null) {
			SQL.append("and category_id="+category);
		}
		List<CalendarEvent> events = jdbcTemplateObject.query(SQL.toString(),new CalenderEventMapper());
		
		return events;
			
	}
}