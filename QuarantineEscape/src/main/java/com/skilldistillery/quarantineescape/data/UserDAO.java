package com.skilldistillery.quarantineescape.data;

import java.util.List;

import com.skilldistillery.quarantineescape.entities.User;

public interface UserDAO {
	
	public User createUser(User user);
	public boolean deleteUser(int userId);
	public User updateUser(User user, int userId);
	public User login(String userName, String password);
	public User findUserById(int userId);
	List<User> findAll();
	
	
	public User deactivate(int id);
	public User activate(int id);

}
