package com.skilldistillery.quarantineescape.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.quarantineescape.entities.Host;
import com.skilldistillery.quarantineescape.entities.Location;
import com.skilldistillery.quarantineescape.entities.User;

@Service
@Transactional
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
		em.remove(host);
		em.flush();
		if (host == null) {
			return true;
		}
		return false;
	}

	@Override
	public Host updateHost(Host host, int hostId, Location loc) {
		Host updatedHost = em.find(Host.class, hostId);
		Location updatedLoc = em.find(Location.class, loc.getId());
		//sys.err shows host location ID is null. null pointer exception at updatedHost.getLocation()
		//host, hostId, and loc all print correct data
		System.err.println("host: " + host);
		System.err.println("host location id: " + host.getLocation());
		System.err.println("hostId: " + hostId);
		System.err.println("loc: " + loc);
		
		updatedHost.setHostName(host.getHostName());
		updatedHost.setEmail(host.getEmail());
		updatedHost.setPhoneNumber(host.getPhoneNumber());
		updatedHost.setUrl(host.getUrl());
		updatedHost.setUrlLogo(host.getUrlLogo());
		updatedHost.getLocation().setAddress(loc.getAddress());
		updatedHost.getLocation().setCity(loc.getCity());
		updatedHost.getLocation().setCountry(loc.getCountry());
		updatedHost.getLocation().setPostalCode(loc.getPostalCode());
		updatedHost.getLocation().setState(loc.getState());
		em.flush();
		return updatedHost;
	}

	@Override
	public Host findHostById(int hostId) {
		Host host = em.find(Host.class, hostId);
		return host;
	}

	@Override
	public List<Host> findAll() {
		String jpql = "SELECT h FROM Host h";
		return em.createQuery(jpql, Host.class).getResultList();
	}

	@Override
	public Host deactivate(int id) {
		Host host = em.find(Host.class, id);
		host.setActive(false);
		em.persist(host);
		em.flush();
		return host;
	}
}
