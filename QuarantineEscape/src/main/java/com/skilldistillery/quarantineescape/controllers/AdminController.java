package com.skilldistillery.quarantineescape.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.quarantineescape.data.AdminDAO;
import com.skilldistillery.quarantineescape.data.EventDAO;
import com.skilldistillery.quarantineescape.data.UserDAO;
import com.skilldistillery.quarantineescape.entities.Event;
import com.skilldistillery.quarantineescape.entities.Role;
import com.skilldistillery.quarantineescape.entities.User;

@Controller
public class AdminController {

//	@Autowired
//	private UserDAO dao;
	@Autowired
	private EventDAO eDao;
	@Autowired
	private AdminDAO adminDao;
	

	
	@RequestMapping(path = "deactivateEvent.do", method = RequestMethod.POST)
	public String deactivateEvent(int eventId, Model model, HttpSession session) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		System.out.println(session.getAttribute("loggedInUser"));
		System.out.println(currentUser.getRole().equals(Role.Admin));
		if (currentUser.getRole().equals(Role.Admin)) {
		adminDao.deactivateEvent(eventId);
		model.addAttribute("events", eDao.findAll());
		return "listAllEvents";
		} else {
			return "index";
		}
		
	}
	
	
//	@RequestMapping(path = "activateEvent.do", method = RequestMethod.POST)
//	public String activateEvent(int eventId, Model model) {
//		if (user.getRole().equals(Role.Admin)) {
//		adminDao.activateEvent(eventId);
//		model.addAttribute("events", eDao.findAll());
//		return "listAllEvents";
//	}

}

