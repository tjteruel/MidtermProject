package com.skilldistillery.quarantineescape.data;

import java.util.List;

import com.skilldistillery.quarantineescape.entities.Event;
import com.skilldistillery.quarantineescape.entities.Host;
import com.skilldistillery.quarantineescape.entities.User;

public interface AdminDAO {
	
	public User deactivateUser(int id);
	public User activateUser(int id);
	
	public List<Event> getDeactivatedEvents();
	public List<User> getDeactivatedUsers();
	public List<User> getActiveUsers();
	public List<Event> getActiveEvents();
	Event deactivateEvent(int id);
	Event activateEvent(int id);
	public Host deactivateHost(int id);
	public Host activateHost(int id);

}
