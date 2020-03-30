package com.skilldistillery.quarantineescape.data;

import java.util.List;

import com.skilldistillery.quarantineescape.entities.Host;

public interface HostDAO {
	
	public Host createHost(Host host);
	public boolean deleteHost(int hostId);
	public Host updateHost(Host host, int hostId);
	public Host findHostById (int hostId);
	public List<Host> findAll();
}
