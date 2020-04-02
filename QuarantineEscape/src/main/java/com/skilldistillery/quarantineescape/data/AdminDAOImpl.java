package com.skilldistillery.quarantineescape.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.quarantineescape.entities.Event;
import com.skilldistillery.quarantineescape.entities.Host;
import com.skilldistillery.quarantineescape.entities.User;

@Service
@Transactional
public class AdminDAOImpl implements AdminDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public User deactivateUser(int id) {
		User user = em.find(User.class, id);
		user.setActive(false);
		em.persist(user);
		em.flush();
		return user;
		
	}

	@Override
	public User activateUser(int id) {
		User user = em.find(User.class, id);
		user.setActive(true);
		em.persist(user);
		em.flush();
		return user;
	}
	
	@Override
	public Event deactivateEvent(int id) {
		Event event = em.find(Event.class, id);
		event.setActive(false);
		em.persist(event);
		em.flush();
		return event;
	}

	@Override
	public Event activateEvent(int id) {
		Event event = em.find(Event.class, id);
		event.setActive(true);
		em.persist(event);
		em.flush();
		return event;
	}

	@Override
	public Host deactivateHost(int id) {
		Host host = em.find(Host.class, id);
		host.setActive(false);
		em.persist(host);
		em.flush();
		return host;
	}
	
	@Override
	public Host activateHost(int id) {
		Host host = em.find(Host.class, id);
		host.setActive(true);
		em.persist(host);
		em.flush();
		return host;
	}
	@Override
	public List<Event> getDeactivatedEvents() {
		String query = "SELECT event FROM Event event WHERE event.active = 0";
		List<Event> events = em.createQuery(query, Event.class).getResultList();
		return events;
	}

	@Override
	public List<User> getDeactivatedUsers() {
		String query = "SELECT user FROM User user WHERE user.active = 0";
		List<User> users = em.createQuery(query, User.class).getResultList();
		return users;
	}

	@Override
	public List<User> getActiveUsers() {
		String query = "SELECT user FROM User user WHERE user.active = 1";
		List<User> users = em.createQuery(query, User.class).getResultList();
		return users;
	}

	@Override
	public List<Event> getActiveEvents() {
		String query = "SELECT event FROM Event event WHERE event.active = 1";
		List<Event> events = em.createQuery(query, Event.class).getResultList();
		return events;
	}


}
