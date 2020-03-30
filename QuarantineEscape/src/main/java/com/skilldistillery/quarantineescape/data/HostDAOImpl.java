package com.skilldistillery.quarantineescape.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.quarantineescape.entities.Host;
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
		return false;
	}

	@Override
	public Host updateHost(Host host, int hostId) {
		Host updatedHost = em.find(Host.class, hostId);
		updatedHost.setHostName(host.getHostName());
		updatedHost.setEmail(host.getEmail());
		updatedHost.setLocation(host.getLocation());
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
	@Override
	public List<Host> findAll() {
		String jpql = "SELECT h FROM Host h";
		return em.createQuery(jpql, Host.class).getResultList();
	}
}
