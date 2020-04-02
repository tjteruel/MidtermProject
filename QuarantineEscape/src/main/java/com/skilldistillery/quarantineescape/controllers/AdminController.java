package com.skilldistillery.quarantineescape.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.quarantineescape.data.AdminDAO;
import com.skilldistillery.quarantineescape.data.EventDAO;
import com.skilldistillery.quarantineescape.data.HostDAO;
import com.skilldistillery.quarantineescape.data.UserDAO;
import com.skilldistillery.quarantineescape.entities.Role;
import com.skilldistillery.quarantineescape.entities.User;

@Controller
public class AdminController {

	@Autowired
	private UserDAO uDao;
	@Autowired
	private EventDAO eDao;
	@Autowired
	private AdminDAO adminDao;
	@Autowired
	private HostDAO hDao;

	@RequestMapping(path = "deactivateEvent.do", method = RequestMethod.POST)
	public String deactivateEvent(int eventId, Model model, HttpSession session) {
		User currentUser = (User) session.getAttribute("loggedInUser");
//		System.out.println(session.getAttribute("loggedInUser"));
//		System.out.println(currentUser.getRole().equals(Role.Admin));
		if (currentUser.getRole().equals(Role.Admin)) {
			adminDao.deactivateEvent(eventId);
			model.addAttribute("events", eDao.findAll());
			return "listAllEvents";
		} else {
			return "userLandingPage";
		}
	}

	@RequestMapping(path = "activateEvent.do", method = RequestMethod.POST)
	public String activateEvent(int eventId, Model model, HttpSession session) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		if (currentUser.getRole().equals(Role.Admin)) {
			adminDao.activateEvent(eventId);
			model.addAttribute("events", eDao.findAll());
			return "listAllEvents";
		} else {
			return "userLandingPage";
		}
	}
	
	@RequestMapping(path = "deactivateUser.do", method = RequestMethod.POST)
	public String deactivateUser(HttpSession session, int userId, Model model) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		if (currentUser.getRole().equals(Role.Admin)) {
		adminDao.deactivateUser(userId);
		model.addAttribute("users", uDao.findAll());
		return "listAllUsers";
		} else {
			return "userLandingPage";
		}
	}
	
	@RequestMapping(path = "activateUser.do", method = RequestMethod.POST)
	public String activateUser(HttpSession session, int userId, Model model) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		if (currentUser.getRole().equals(Role.Admin)) {
		adminDao.activateUser(userId);
		model.addAttribute("users", uDao.findAll());
		return "listAllUsers";
	} else {
		return "userLandingPage";
	}
	}
	@RequestMapping(path = "deactivateHost.do", method = RequestMethod.POST)
	public String deactivateHost(HttpSession session, int hostId, Model model) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		if (currentUser.getRole().equals(Role.Admin)) {
		adminDao.deactivateHost(hostId);
		model.addAttribute("hosts", hDao.findAll());
		return "listAllHosts";
	} else {
		return "userLandingPage";
	}
	}
	@RequestMapping(path = "activateHost.do", method = RequestMethod.POST)
	public String activateHost(HttpSession session, int hostId, Model model) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		if (currentUser.getRole().equals(Role.Admin)) {
		adminDao.activateHost(hostId);
		model.addAttribute("hosts", hDao.findAll());
		return "listAllHosts";
	} else {
		return "userLandingPage";
	}
}
}
