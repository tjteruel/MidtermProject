package com.skilldistillery.quarantineescape.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.quarantineescape.data.EventDAO;
import com.skilldistillery.quarantineescape.entities.Category;
import com.skilldistillery.quarantineescape.entities.User;

@Controller
public class HomeController {
	
	@Autowired
	private EventDAO eventDao;
	


		@RequestMapping(path = {"/","home.do"})
		public String home(Model model) {
			model.addAttribute("events", eventDao.findAll());
	
			return "index";
		}
		
		@RequestMapping(path = "gotoHome.do", method= RequestMethod.GET)
		public String login(HttpSession session) {
		User user =	(User) session.getAttribute("loggedInUser");
			
			if (user == null) {
				return "index";
			} else {
				
				return "profileView";
			}
			
		}
		
		@RequestMapping(path = "createUserPage.do")
		public String signUpPage() {
			return "signUp";
		}
		
		@RequestMapping(path = "signInPage.do")
		public String signInPage() {
			return "signIn";
		}
		
		@RequestMapping(path = "meetTheTeam.do")
		public String meetTeam() {
			return "meetTeam";
		}
		@RequestMapping(path = "userProfilePage.do")
		public String userProfile() {
			return "userProfile";
		}
		
		@RequestMapping(path="categoryForm.do")
		public String categoryCreate() {
			return "categoryForm";
		}
		
		
		@RequestMapping(path="locationForm.do")
		public String locationCreate() {
			return "locationForm";
		}
		

//		@RequestMapping(path="listUsers.do")
//		public String userCreate() {
//			return "listAllUsers";
//		}
//		
	

		@RequestMapping(path = "createEventPage.do")
		public String eventPage() {
			return "createEvent";
		}
	
		@RequestMapping(path = "subscribe.do")
		public String suscribe() {
			return "subscribe";
		}
		


		
}
