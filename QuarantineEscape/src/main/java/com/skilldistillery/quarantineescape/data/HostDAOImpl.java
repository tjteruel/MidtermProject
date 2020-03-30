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

//	//USER LOGIN
//	@Override
//	public Host login(String userName, String password) {
//		String query = "SELECT host FROM Host host where host.userName = :uName AND"
//				+ "	host.password = :pWord AND host.enabled = 1";
//		List<Host> hosts = em.createQuery(query, Host.class).setParameter("uName", userName)
//				.setParameter("pWord", password).getResultList();
//		return hosts.size() >0 ? hosts.get(0) : null;
//	}
}
