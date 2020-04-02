package com.skilldistillery.quarantineescape.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.quarantineescape.entities.Event;
import com.skilldistillery.quarantineescape.entities.Role;
import com.skilldistillery.quarantineescape.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO{
	
	@PersistenceContext
	private EntityManager em;
	
	//CREATE NEW USER
	@Override
	public User createUser(User user) {
		user.setRole(Role.User);
		user.setActive(true);
		user.setEnabled(true);
		em.persist(user);
		em.flush();
		return user;
	}
	
	//DELETE EXISTING USER
	@Override
	public boolean deleteUser(int userId) {
		User user = em.find(User.class, userId);
		em.remove(user);
		em.flush();
		if (user == null) {
			return true;
		} 
		return false;
	}
	
	//UPDATE EXISTING USER
	@Override
	public User updateUser(User user, int userId) {
		User updatedUser = em.find(User.class, userId);
		updatedUser.setFirstName(user.getFirstName());
		updatedUser.setLastName(user.getLastName());
		updatedUser.setPassword(user.getPassword());
		updatedUser.setUserImageUrl(user.getUserImageUrl());
		updatedUser.setCreatedAt(user.getCreatedAt());
		updatedUser.setUserDescription(user.getUserDescription());
		updatedUser.setEnabled(user.getEnabled());
		updatedUser.setRole(user.getRole());
		updatedUser.setCategoryComments(user.getCategoryComments());
		updatedUser.setUserEvents(user.getUserEvents());
		updatedUser.setEventComments(user.getEventComments());
		updatedUser.setEmail(user.getEmail());
		updatedUser.setUsername(user.getUsername());
		updatedUser.setActive(user.getActive());
		
		em.flush();
		return updatedUser;
	}

	//USER LOGIN
	@Override
	public User login(String username, String password) {
		String query = "SELECT user FROM User user where user.username = :username AND"
				+ "	user.password = :password";
		User user;
		try {
			
			user = em.createQuery(query, User.class).setParameter("username", username)
					.setParameter("password", password).getResultList().get(0);
			System.out.println(user);
		} catch (IndexOutOfBoundsException e) {
			user = null;
		}
		return user;
	}
	
	//FIND USER BY ID
	@Override
	public User findUserById(int userId) {
		User user = em.find(User.class, userId);
		return user;
	}

	@Override
	public List<User> findAll() {
		String jpql = "SELECT u FROM User u";
		return em.createQuery(jpql, User.class).getResultList();
	}
	
	//USER RSVP TO EVENT
	public boolean addEventToRSVP(int eventId, int userId) {
	Event event = em.find(Event.class, eventId);
	User managedUser = em.find(User.class, userId);
	//managedUser.addEvent(event);
	return false;
	}

//	@Override
//	public User deactivate(int id) {
//		User user = em.find(User.class, id);
//		user.setActive(false);
//		em.persist(user);
//		em.flush();
//		return user;
//		
//	}
//
//	@Override
//	public User activate(int id) {
//		User user = em.find(User.class, id);
//		user.setActive(true);
//		em.persist(user);
//		em.flush();
//		return user;
//	}

}
