package com.skilldistillery.quarantineescape.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.skilldistillery.quarantineescape.entities.Host;
import com.skilldistillery.quarantineescape.entities.User;

public class HostDAOImpl implements HostDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Host createHost(Host host) {
		em.persist(host);
		em.flush();
		return host;
	}

	@Override
	public boolean deleteHost(int hostId) {
		Host host = em.find(Host.class, hostId);
		return false;
	}

	@Override
	public Host updateHost(Host host, int hostId) {
		Host updatedHost = em.find(Host.class, hostId);
		updatedHost.setHostName(host.getHostName());
		updatedHost.setEmail(host.getEmail());
		updatedHost.setLocationId(host.getLocationId());
		updatedHost.setPhoneNumber(host.getPhoneNumber());
		updatedHost.setUrl(host.getUrl());
		updatedHost.setUrlLogo(host.getUrlLogo());

		return host;
	}

	@Override
	public Host findHostById(int hostId) {
		Host host = em.find(Host.class, hostId);
		return null;
	}

}
