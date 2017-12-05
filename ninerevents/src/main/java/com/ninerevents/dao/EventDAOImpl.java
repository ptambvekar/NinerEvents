package com.ninerevents.dao;

import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.ninerevents.model.CalendarEvent;
import com.ninerevents.model.Event;
import com.ninerevents.model.EventCategory;
import com.ninerevents.model.EventLocation;
import com.ninerevents.model.EventName;
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
		String SQL = "SELECT * FROM Event WHERE Date(event_start) IN (SELECT * FROM ( SELECT DISTINCT Date(event_start) as event_start FROM Event WHERE event_start > CURDATE( )+1 ORDER BY event_start LIMIT 3) AS t)";
		
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
		Random ran = new Random();
		int x = ran.nextInt(1) + 5;
		String SQL = "INSERT INTO EVENT " +
			"(event_name, description, event_start, event_end, category_id, venue_id, host_id) VALUES (?, ?, ?, ?,?,?,?)";

		jdbcTemplateObject = new JdbcTemplate(dataSource);
		jdbcTemplateObject.update(SQL, new Object[] { event.getEventName(),
			event.getEventDescription(), event.getStartDateTime(), event.getEndDateTime(),
			event.getEventCategory(),event.getVenue_name(),x});
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
		jdbcTemplateObject = new JdbcTemplate(dataSource);
		List<EventLocation> locations = jdbcTemplateObject.query(SQL, new BeanPropertyRowMapper(EventLocation.class));
		return locations;
	}

	@Override
	public List<EventCategory> getEventType() {
		String SQL = "select t.id as id, t.category_name as categoryName from category t";
		jdbcTemplateObject = new JdbcTemplate(dataSource);
		List<EventCategory> locations = jdbcTemplateObject.query(SQL, new BeanPropertyRowMapper(EventCategory.class));
		return locations;
	}
	
	@Override
	public List<EventName> getEventName() {
		String SQL = "select t.id as id, t.event_name as eventName from event t where t.event_end < CURDATE()";
		jdbcTemplateObject = new JdbcTemplate(dataSource);
		List<EventName> eventNames = jdbcTemplateObject.query(SQL, new BeanPropertyRowMapper(EventName.class));
		return eventNames;
	}

	@Override
	public List<CalendarEvent> getSearchResults(String keyword,String location, String category) {
		StringBuilder SQL = new StringBuilder("select * from event where LOWER(event_name) like LOWER('%"+keyword+"%')");
		jdbcTemplateObject = new JdbcTemplate(dataSource);
		if(location!=null) {
			SQL.append(" and venue_id="+location);
		}
		if(category!=null) {
			SQL.append(" and category_id="+category);
		}
		List<CalendarEvent> events = jdbcTemplateObject.query(SQL.toString(),new CalenderEventMapper());
		
		return events;
			
	}

	/**
	 * Return Codes:
	 * id > 0 = the person already exists.
	 * id = "notfound" = this is a new user and needs to first give their details.
	 * id =null --> some other exception while accessing db.  
	 * */
	public String checkPerson(Event event) {
		 String SQL = "select id from person where email_address = ?" ;
		 jdbcTemplateObject = new JdbcTemplate(dataSource);
		 String id =null;
		 try {
			 id = jdbcTemplateObject.queryForObject(SQL, new Object[] {event.getEmail_address()},String.class);	 
		 }
		 catch(DataAccessException e) {
			 e.printStackTrace();
			 if(e instanceof EmptyResultDataAccessException) 
				id="notfound"; 
		 }
		
		 return id;	
	}
	/**
	 * Return Codes:
	 * code>0 = registered to the event successfully
	 * code -1= the user is already registered.
	 * code -2= some other exception while adding records.  
	 * */
	@Override
	public int registerEvents(Event event) {
		
		String SQL = "INSERT INTO Registration " +
				"(person_id, booked_event_id, date_booked) VALUES ((select id from Person where email_address = ?), ?, CURDATE())";
		jdbcTemplateObject = new JdbcTemplate(dataSource);
		int returncode=0;
			try {
				returncode=jdbcTemplateObject.update(SQL, new Object[] {event.getEmail_address(), event.getEventId()});	
			}
			catch(DataAccessException e) {
				e.printStackTrace();
				if(e instanceof DuplicateKeyException)
					returncode =-1;
				else returncode= -2;
			}
		return returncode;
		
	}

	/**
	 * Return Codes:
	 * code>0 = Person added successfully
	 * code -1 = the user already exists.
	 * code -2= some other exception while adding records.  
	 * */
	@Override
	public int registerNewPerson(Event event) {
		String SQL = "INSERT INTO person (first_name, last_name,line1,line2,city,state,zip,email_address) VALUES (?,?,?,?,?,?,?,?)";
		jdbcTemplateObject = new JdbcTemplate(dataSource);
		int returncode=0;
			try {
				returncode=jdbcTemplateObject.update(SQL, new Object[] {event.getFirst_name(), event.getLast_name(),event.getLine1()
				,event.getLine2(),event.getCity(),event.getState(),event.getZip(),event.getEmail_address()});	
			}
			catch(DataAccessException e) {
				e.printStackTrace();
				if(e instanceof DuplicateKeyException)
					returncode =-1;
				else returncode= -2;
			}
		return returncode;
	}
	
	@Override
	public int insertFeedback(Event event) {
		
		int returncode=0;
		try {
		String SQL = "INSERT INTO feedback (email,first_name, last_name, event_id, rating, comments) VALUES (?,?, ?, ?, ?,?)";
		jdbcTemplateObject = new JdbcTemplate(dataSource);

		returncode=jdbcTemplateObject.update(SQL, new Object[] { event.getEmail_address(),event.getFirst_name(), event.getLast_name(), new Integer(event.getEventId()),
				event.getRating(), event.getComments() });event.setEmail_address("jd@uncc.edu");
		}
		catch(DataAccessException e) {
			e.printStackTrace();
			if(e instanceof DuplicateKeyException)
				returncode =-1;
			else returncode= -2;
		}
		return returncode;
	}
	
	
}