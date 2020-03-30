package com.skilldistillery.quarantineescape.data;

import java.util.List;

import com.skilldistillery.quarantineescape.entities.Event;
import com.skilldistillery.quarantineescape.entities.EventComment;
import com.skilldistillery.quarantineescape.entities.User;
import com.skilldistillery.quarantineescape.entities.UserEvent;

public interface EventDAO {
	
	public Event createEvent(Event event);
	
	public boolean deleteEvent(int eventId);
	
	public Event updateEvent(Event event, int eventId);
	
	public UserEvent findUserEvent(int eventId, int userId);
	
	public Event findEventById(int id);
	
	public UserEvent createUserEvent(Event event, User user);
	
	public boolean deleteUserEvent(Event event, User user);
	
	public UserEvent setUserEvent(UserEvent userEvent);
	
	public EventComment submitEventComment(EventComment eComment);
	
	public boolean deleteComment(int commentId);
	
	public List<EventComment> getEventCommentByEventId(int eventId);
	

}
