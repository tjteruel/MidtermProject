package com.skilldistillery.quarantineescape.data;

import java.util.List;

import com.skilldistillery.quarantineescape.entities.Event;
import com.skilldistillery.quarantineescape.entities.User;

public interface AdminDAO {
	
	public List<Event> getDeactivatedEvents();
	public List<User> getDeactivatedUsers();
	public List<User> getActiveUsers();
	public List<Event> getActiveEvents();

}
