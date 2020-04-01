package com.skilldistillery.quarantineescape.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.quarantineescape.entities.Category;
import com.skilldistillery.quarantineescape.entities.Event;
import com.skilldistillery.quarantineescape.entities.EventComment;
import com.skilldistillery.quarantineescape.entities.User;
import com.skilldistillery.quarantineescape.entities.UserEvent;
import com.skilldistillery.quarantineescape.entities.UserEventId;

@Service
@Transactional
public class EventDAOImpl implements EventDAO {

	@PersistenceContext
	private EntityManager em;

	// CREATE NEW EVENT
	@Override
	public Event createEvent(Event event) {
		em.persist(event);
		em.flush();
		em.close();
		return event;
	}

	// DELETE EXISTING EVENT
	@Override
	public boolean deleteEvent(int eventId) {
		Event event = em.find(Event.class, eventId);
		em.remove(event);
		em.flush();
		if (event == null) {
			return true;
		}
		return false;
	}

	// UPDATE EXISTING EVENT
	@Override
	public Event updateEvent(Event event, int eventId) {
		Event updatedEvent = em.find(Event.class, eventId);

		updatedEvent.setTitle(event.getTitle());
		updatedEvent.setDescription(event.getDescription());
		updatedEvent.setEventDate(event.getEventDate());
		updatedEvent.setEventTime(event.getEventTime());
		updatedEvent.setEventLink(event.getEventLink());
		updatedEvent.setPublicOrPrivate(event.getPublicOrPrivate());
		updatedEvent.setEventImageUrl(event.getEventImageUrl());
		updatedEvent.setStatus(event.getStatus());
		updatedEvent.setPrereqs(event.getPrereqs());
		updatedEvent.setCreatedAt(event.getCreatedAt());
		updatedEvent.setCategories(event.getCategories());
		updatedEvent.setTags(event.getTags());
		updatedEvent.setUserEvents(event.getUserEvents());
		updatedEvent.setEventComments(event.getEventComments());
		updatedEvent.setHost(event.getHost());
		updatedEvent.setLocation(event.getLocation());
		updatedEvent.setActive(event.getActive());
		em.flush();
		return updatedEvent;
	}

	// FIND EXISTING EVENT
	@Override
	public UserEvent findUserEvent(int eventId, int userId) {
		UserEventId userEventId = new UserEventId(userId, eventId);
		UserEvent userEvent = em.find(UserEvent.class, userEventId);
		return userEvent;
	}

	// UPDATES USEREVENT TABLE
	@Override
	public UserEvent createUserEvent(Event event, User user) {
		UserEventId userEventId = new UserEventId(user.getId(), event.getId());
		UserEvent userEvent = new UserEvent();
		userEvent.setId(userEventId);
		userEvent.setEvent(event);
		userEvent.setAttended(false);
		em.persist(userEvent);
		em.flush();
		return userEvent;
	}

	@Override
	public boolean deleteUserEvent(Event event, User user) {
		UserEventId userEventId = new UserEventId(user.getId(), event.getId());
		UserEvent userEvent = em.find(UserEvent.class, userEventId);
		em.remove(userEvent);
		em.flush();
		boolean result = true;
		if (em.find(UserEvent.class, userEventId) == null) {
			result = true;
		} else {
			result = false;
		}
		return result;
	}

	@Override
	public UserEvent setUserEvent(UserEvent userEvent) {
		em.persist(userEvent);
		em.flush();
		return userEvent;
	}

	@Override
	public EventComment submitEventComment(EventComment eComment) {
		em.persist(eComment);
		em.flush();
		return null;
	}

	// DELETES COMMENT
	@Override
	public boolean deleteComment(int commentId) {
		EventComment eComment = em.find(EventComment.class, commentId);
		em.remove(eComment);
		em.flush();

		if (eComment == null) {
			return true;
		}
		return false;
	}

	// FINDS COMMENTS BY EVENT ID
	@Override
	public List<EventComment> getEventCommentByEventId(int eventId) {
		String query = "SELECT eComment FROM EventComment eComment WHERE eComment.event.id = :eId";
		List<EventComment> eComments = em.createQuery(query, EventComment.class).setParameter("eId", eventId)
				.getResultList();
		return eComments;
	}

	@Override
	public Event findEventById(int id) {
		Event eventFound = em.find(Event.class, id);
		return eventFound;
	}

	@Override
	public List<Event> findAll() {
		String jpql = "Select e From Event e";
		return em.createQuery(jpql, Event.class).getResultList();
	}

	@Override
	public List<Event> findByCategory(String name) {
		String jpql = "select event from Event event join event.categories category "
				+ " where category.name like :name";
		return em.createQuery(jpql, Event.class).setParameter("name", "%" + name + "%").getResultList();

	}

	@Override
	public Event deactivate(int id) {
		Event event = em.find(Event.class, id);
		event.setActive(false);
		em.persist(event);
		em.flush();
		return event;
	}

	@Override
	public Event activate(int id) {
		Event event = em.find(Event.class, id);
		event.setActive(true);
		em.flush();
		return event;
	}

}
