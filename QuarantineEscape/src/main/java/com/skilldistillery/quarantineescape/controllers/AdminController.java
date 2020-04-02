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
	
	public boolean checkIfAdmin(HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		if (user.getRole().equals(Role.Admin)) {
			return true;
		} else {
			return false;
		}
	}
	
	public Model refresh(Model model) {
		List<User> activeUsers = adminDao.getActiveUsers();
		model.addAttribute("activeUsers", activeUsers);
		
		List<User> deactivatedUsers = adminDao.getDeactivatedUsers();
		model.addAttribute("deactivatedUsers", deactivatedUsers);
		
		List<Event> activeEvents = adminDao.getActiveEvents();
		model.addAttribute("activeEvents", activeEvents);
		
		List<Event> deactivatedEvents = adminDao.getDeactivatedEvents();
		model.addAttribute("deactivatedEvents", deactivatedEvents);
		return model;
	}
	
	@RequestMapping(path = "adminSettings.do", method = RequestMethod.GET)
	public String adminSettings(HttpSession session, Model model) {
		if (checkIfAdmin(session) == true) {
			
			model = refresh(model);
//			model.addAttribute("sectionNumber", 1);
			
			return "adminLandingPage";
		} else {
			session.removeAttribute("loggedInUser");
			return "userLandingPage";
		}
	}
	
	@RequestMapping(path = "deactivateEvent.do", method = RequestMethod.POST)
	public String deactivateEvent(int eventId, Model model) {
		adminDao.deactivateEvent(eventId);
		model.addAttribute("events", eDao.findAll());
		return "listAllEvents";
	}
//	@RequestMapping(path = "activateEvent.do", method = RequestMethod.POST)
//	public String activateEvent(int eventId, Model model) {
//		if (user.getRole().equals(Role.Admin)) {
//		adminDao.activateEvent(eventId);
//		model.addAttribute("events", eDao.findAll());
//		return "listAllEvents";
//	}

	
}
