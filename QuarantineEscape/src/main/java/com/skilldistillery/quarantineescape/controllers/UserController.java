package com.skilldistillery.quarantineescape.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.quarantineescape.data.UserDAO;
import com.skilldistillery.quarantineescape.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO dao;
	
	@RequestMapping(path = "findUser.do", method = RequestMethod.GET, params = "id")
	public String findUser(@RequestParam Integer id, Model model) {
		String view = "show";
		User user = dao.findUserById(id);
		model.addAttribute("user", user);
		return view;
	}

	@RequestMapping(path = "createUser.do", method = RequestMethod.POST)
	public ModelAndView createUser(User user) {
		dao.createUser(user);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	//Need to fix this to sign in
	@RequestMapping(path = "signIn.do", method = RequestMethod.POST)
	public String signIn(HttpSession session, String username, String password, Model model) {
		User user = dao.login(username, password);
		if (user == null) {
			return "index";
		} else {
			session.setAttribute("loggedInUser", user);
			model.addAttribute("sectionNumber", 1);
			return "userProfile";
		}
	}
	
	@RequestMapping(path = "deleteUser.do", method = RequestMethod.POST)
	public String deleteUser(@RequestParam("userId") int id) {
		User user = dao.findUserById(id);
		dao.deleteUser(user.getId());
		return "userAdded";
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
	public String updateUser(@RequestParam("id")int id, User user) {
		dao.updateUser(user, id);
		return "userAdded";
	}
	
	
	
	
}
