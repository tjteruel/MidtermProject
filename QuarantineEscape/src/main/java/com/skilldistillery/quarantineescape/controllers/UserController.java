package com.skilldistillery.quarantineescape.controllers;

import java.util.List;

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
import com.skilldistillery.quarantineescape.entities.UserEvent;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao;
	@Autowired
	private EventDAO eDao;
	
	@RequestMapping(path = "findUser.do", method = RequestMethod.GET,params="id")
	public String findUser(@RequestParam Integer id, Model model, HttpSession session) {
		System.out.println(id);
		String view = "show";
		User user = dao.findUserById(id);
		if (user == null) {
			return "index";
		} else {
			model.addAttribute("user", user);
			model.addAttribute("attendingEvents", eDao.findAllAttendingEvents(user.getId()));
		}
		return view;
	}

	@RequestMapping(path = "createUser.do", method = RequestMethod.POST)
	public ModelAndView createUser(User user) {
		dao.createUser(user);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping(path = "signIn.do", method = RequestMethod.POST)
	public String signIn(HttpSession session, User user, Model model) {
		System.out.println(user.getUsername() + user.getPassword());
		User userLoggedIn = dao.login(user.getUsername(), user.getPassword());
		if (userLoggedIn == null ) {
			return "index";
		} else {
			session.setAttribute("loggedInUser", userLoggedIn);
			model.addAttribute("events", eDao.findAll());
			model.addAttribute("attendingEvents", eDao.findAllAttendingEvents(userLoggedIn.getId()));
			return "userLandingPage";
		}
	}
	
	@RequestMapping(path = "deleteUser.do", method = RequestMethod.POST)
	public String deleteUser(@RequestParam("userId") int id) {
		User user = dao.findUserById(id);
		dao.deleteUser(user.getId());
		return "index";
	}
	
	@RequestMapping(path = "updatePage.do", method = RequestMethod.POST)
	public ModelAndView updateUser(@RequestParam("user") int id) {
		User user = dao.findUserById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", user);
		mv.setViewName("updateUser");
		return mv;
	}
	
	@RequestMapping(path = "updateUser.do", method = RequestMethod.POST)
	public String updateUser(@RequestParam("id")int id, User user, HttpSession session, Model model) {
		dao.updateUser(user, id);
		User loggedUser = (User) session.getAttribute("loggedInUser"); 
		loggedUser = dao.findUserById(user.getId());
		List<UserEvent> attendingEvents = eDao.findAllAttendingEvents(user.getId());
		model.addAttribute("attendingEvents", attendingEvents);
		model.addAttribute("user", user);
		return "show";
	}
	
	@RequestMapping(path = "listUsers.do")
	public String showUsers(Model model) {
		model.addAttribute("users", dao.findAll());
		return "listAllUsers";
	}
	
	@RequestMapping(path = "logout.do", method = RequestMethod.GET)
	public String logout(Model model, HttpSession session) {
			session.removeAttribute("loggedInUser");
			return "logout";
		}




	

//	@RequestMapping(path = "deactivateUser.do", method = RequestMethod.POST)
//	public String deactivateUser(HttpSession session, int userId, Model model) {
//		dao.deactivate(userId);
//		model.addAttribute("users", dao.findAll());
//		return "listAllUsers";
//	}
//	
//	@RequestMapping(path = "activateUser.do", method = RequestMethod.POST)
//	public String activateUser(int userId, Model model) {
//		dao.activate(userId);
//		model.addAttribute("users", dao.findAll());
//		return "listAllUsers";
//	}

	
}
