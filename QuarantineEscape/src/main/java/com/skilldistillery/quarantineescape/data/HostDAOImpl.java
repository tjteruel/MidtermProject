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
		updatedHost.setHostName(host.getHostName());
		updatedHost.setEmail(host.getEmail());
		updatedHost.setPhoneNumber(host.getPhoneNumber());
		updatedHost.setUrl(host.getUrl());
		updatedHost.setUrlLogo(host.getUrlLogo());
//		updatedHost.setAddress(host.getAddress();
//		updatedHost.setLocation(loc.setAddress(loc.getAddress()));
		loc.setCity(loc.getCity());
		loc.setCountry(loc.getCountry());
		loc.setPostalCode(loc.getPostalCode());
		loc.setState(loc.getState());
		
		return host;
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
}
