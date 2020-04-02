package com.skilldistillery.quarantineescape.data;

import java.util.List;

import com.skilldistillery.quarantineescape.entities.Event;
import com.skilldistillery.quarantineescape.entities.Host;
import com.skilldistillery.quarantineescape.entities.Location;

public interface HostDAO {
	
	public Host createHost(Host host);
	public boolean deleteHost(int hostId);
	public Host updateHost(Host host, int hostId, Location loc);
	public Host findHostById (int hostId);
	public List<Host> findAll();
	
//	public Host deactivate(int id);
}
