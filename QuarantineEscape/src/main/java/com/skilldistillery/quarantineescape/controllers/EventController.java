package com.skilldistillery.quarantineescape.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.quarantineescape.data.EventDAO;
import com.skilldistillery.quarantineescape.entities.Event;
import com.skilldistillery.quarantineescape.entities.User;

@Controller
public class EventController {

	@Autowired
	private EventDAO dao;

	@RequestMapping(path = "listEvents.do")
	public String showUsers(Model model) {
		model.addAttribute("events", dao.findAll());
		return "listAllEvents";
	}

	@RequestMapping(path = "findEvent.do", method = RequestMethod.GET, params = "id")
	public String findEventById(@RequestParam int id, Model model) {
		String view = "Event";
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
		return "eventDeleted";
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
	public String updatedEvent(@RequestParam("id")int id, Event event) {

		dao.updateEvent(event, id);
		return "index";
	}

	@RequestMapping(path = "searchByCategory.do")
	public String searchByCategory(@RequestParam("name") String name, Model model) {
		model.addAttribute("events", dao.findByCategory(name));

		return "listAllEvents";
	}

}
