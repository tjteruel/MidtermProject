package com.skilldistillery.quarantineescape.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.quarantineescape.data.EventDAO;
import com.skilldistillery.quarantineescape.data.UserDAO;
import com.skilldistillery.quarantineescape.entities.User;

@Controller
public class AdminController {

	@Autowired
	private UserDAO dao;
	@Autowired
	private EventDAO eDao;
	
//	public boolean checkIfAdmin(HttpSession session) {
//		User user = (User) session.getAttribute("loggedInUser");
//		if (user.getRole().equalsIgnoreCase("admin")) {
//			return true;
//		} else {
//			return false;
//		}
//	}
	
	

	
}
