package com.skilldistillery.quarantineescape.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.quarantineescape.data.LocationDAO;
import com.skilldistillery.quarantineescape.entities.Location;

@Controller
public class LocationController {

	@Autowired
	private LocationDAO locationDao;

	@RequestMapping(path = "createLocation.do", method = RequestMethod.POST)
	public ModelAndView createLoaction(Location location) {
		locationDao.createLocation(location);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping(path = "deleteLocation.do", params = "id")
	public ModelAndView deleteLocation(int id) {
		boolean isDeleted = locationDao.deleteLocation(id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("deletedLocatiom");
		mv.addObject("isDeleted", isDeleted);
		mv.addObject("locationId", id);
		return mv;
	}

	@RequestMapping(path = "updateLocation.do", method = RequestMethod.POST)
	public ModelAndView updateLocation(@RequestParam("location") int id) {
		Location location = locationDao.findLocationById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("location", location);
		mv.setViewName("updateLocation");
		return mv;
	}

}
