package com.skilldistillery.quarantineescape.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

		@RequestMapping(path = {"/","home.do"})
		public String home() {
			return "index";
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
		
		
		
}
