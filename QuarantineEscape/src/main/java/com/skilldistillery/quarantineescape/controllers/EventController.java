package com.skilldistillery.quarantineescape.controllers;

import java.time.LocalDate;
import java.time.LocalDateTime;
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

import com.skilldistillery.quarantineescape.entities.Event;
import com.skilldistillery.quarantineescape.entities.Role;
import com.skilldistillery.quarantineescape.entities.EventComment;
import com.skilldistillery.quarantineescape.data.UserDAO;
//import com.skilldistillery.quarantineescape.entities.Event;
import com.skilldistillery.quarantineescape.entities.User;
import com.skilldistillery.quarantineescape.entities.UserEvent;

@Controller
public class EventController {

	@Autowired
	private EventDAO dao;
	@Autowired
	private UserDAO userDao;
	
//	public boolean checkIfAdmin(HttpSession session) {
//		User user = (User) session.getAttribute("loggedInUser");
//		if (user.getRole().equals(Role.Admin)) {
//			return true;
//		} else {
//			return false;
//		}
//	}

	@RequestMapping(path = "listEvents.do")
	public String showEvents(Model model) {
		model.addAttribute("events", dao.findAll());
		return "listAllEvents";
	}
	

	@RequestMapping(path = "findEvent.do", method = RequestMethod.GET, params = "id")
	public String findEventById(@RequestParam int id, Model model) {
		String view = "showEvent";
		Event event = dao.findEventById(id);
		model.addAttribute("event", event);
		return view;
	}
	


	@RequestMapping(path = "createEvent.do", method = RequestMethod.GET)
	public ModelAndView createEvent(Event event) {
		dao.createEvent(event);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping(path = "deleteEvent.do", method = RequestMethod.POST)
	public String deleteEvent(@RequestParam("eventId") int id) {
//		Event event = dao.findEventById(id);
		dao.deleteEvent(id);
		return "index";
	}

	@RequestMapping(path = "updateEventPage.do", method = RequestMethod.POST)
	public ModelAndView updateEvent(@RequestParam("event") int id) {
		System.err.println(id);
		Event event = dao.findEventById(id);
		System.out.println(event.getTitle());
		ModelAndView mv = new ModelAndView();
		mv.addObject("event", event);
		mv.setViewName("eventUpdated");
		return mv;

	}

	@RequestMapping(path = "eventUpdated.do", method = RequestMethod.POST)
	public String updatedEvent(@RequestParam("id") int id, Event event) {

		dao.updateEvent(event, id);
		return "index";
	}

	@RequestMapping(path = "searchByCategory.do")
	public String searchByCategory(@RequestParam("name") String name, Model model) {
		model.addAttribute("events", dao.findByCategory(name));

		return "listAllEvents";
	}

	@RequestMapping(path = "findByCategory.do")
	public String listOfEventsByCategory(@RequestParam("categoryName") String categoryName, Model model) {
		model.addAttribute("contents", dao.findByCategory(categoryName));
		return "eventList";
	}

	@RequestMapping(path = "attendEvent.do", method = RequestMethod.POST)
	public String attentEvent(Integer eventId, Integer userId, HttpSession session, Model model) {
		System.err.println("eventId: " + eventId);
		User user = (User) session.getAttribute("loggedInUser"); 
		if (user == null) {
			return "index";
		}
		Event event = dao.findEventById(eventId);
		System.err.println("user: " + user);
		
		try {
			UserEvent userEvent =dao.createUserEvent(eventId, user.getId());
			user = userDao.findUserById(user.getId());
			List<UserEvent> attendingEvents = dao.findAllAttendingEvents(user.getId());
			session.setAttribute("loggedInUser", user);
			System.err.println("user: " + user);
			System.err.println("event: " + event);
			System.err.println("userEvent: " + userEvent);
			model.addAttribute("event", event);
			model.addAttribute("user", user);
			model.addAttribute("userEvent", userEvent);
			model.addAttribute("attendingEvents", attendingEvents);
			model.addAttribute("attending", dao.findUserEvent(eventId, user.getId()));
			return "show";
		} catch (Exception e) {
			return "show";
		}
	}

//	@RequestMapping(path = "deactivateEvent.do", method = RequestMethod.POST)
//	public String deactivateEvent(int eventId, Model model) {
//		dao.deactivate(eventId);
//		model.addAttribute("events", dao.findAll());
//		return "listAllEvents";
//	}
//	@RequestMapping(path = "activateEvent.do", method = RequestMethod.POST)
//	public String activateEvent(int eventId, Model model) {
//		dao.activate(eventId);
//		model.addAttribute("events", dao.findAll());
//		return "listAllEvents";
//	}
	
	@RequestMapping(path = "unattendEvent.do", method = RequestMethod.POST)
	public String unattendEvent(Integer eventId, HttpSession session, Model model) {
		System.err.println("eventId: " + eventId);
		User user = (User) session.getAttribute("loggedInUser");
		if (user == null) {
			return "index";
		}
		Event event = dao.findEventById(eventId);
		user = userDao.findUserById(user.getId());
		dao.deleteUserEvent(event, user);
		List<UserEvent> attendingEvents = dao.findAllAttendingEvents(user.getId());
		model.addAttribute("user", user);
		model.addAttribute("attendingEvents", attendingEvents);
		model.addAttribute("event", event);
		model.addAttribute("notAttending", dao.findUserEvent(eventId, user.getId()));
		return "show";
	}
	
	@RequestMapping(path = "createEventComment.do", method = RequestMethod.POST)
	public String createEventComment (Integer eventId, String comment, HttpSession session, Model model) {
		EventComment eComment = new EventComment();
		eComment.setContent(comment);
		eComment.setCreatedAt(LocalDate.now());
		eComment.setUser((User) session.getAttribute("loggedInUser"));
		eComment.setEvent(dao.findEventById(eventId));
		
		eComment = dao.submitEventComment(eComment);
	
		
		List<EventComment> commentsList = dao.getEventCommentByEventId(eventId);
		
		
		model.addAttribute("event", dao.findEventById(eventId));
		model.addAttribute("commentList", commentsList);
		model.addAttribute("notAttending", dao.findUserEvent(eventId, ((User) session.getAttribute("loggedInUser")).getId()));
		return "showEvent";
	}
	
}


