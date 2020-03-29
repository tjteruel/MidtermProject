package com.skilldistillery.quarantineescape.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.skilldistillery.quarantineescape.entities.User;

public class UserDAOImpl implements UserDAO{
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User createUser(User user) {
		em.persist(user);
		em.flush();
		return user;
	}

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

	@Override
	public User updateUser(User user, int userId) {
		
		return null;
	}

	@Override
	public User login(String userName, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User findUserById(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

}
