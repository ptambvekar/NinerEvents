package com.ninerevents.dao;

/*
 * This class should act as a DAO for the Events related data. 
 * */

import java.util.List;
import javax.sql.DataSource;

import com.ninerevents.model.Event;

public interface EventDAO {
   /** 
      * This is the method to be used to initialize
      * database resources ie. connection.
   */
   public void setDataSource(DataSource ds);
   
   /** 
      * This is the method to be used to list down
      * all the records from the Event table.
   */
   
   public List<Event> listEvents();
  
  public Event EventDetails(String id);
 
   
}
