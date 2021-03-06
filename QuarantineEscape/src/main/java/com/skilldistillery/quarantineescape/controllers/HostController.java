package com.skilldistillery.quarantineescape.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.quarantineescape.data.HostDAO;
import com.skilldistillery.quarantineescape.entities.Host;
import com.skilldistillery.quarantineescape.entities.Location;
import com.skilldistillery.quarantineescape.entities.User;


@Controller
public class HostController {

	@Autowired
	private HostDAO dao;
	
	@RequestMapping(path = "findHost.do", method = RequestMethod.GET, params = "id")
	public String findHost(@RequestParam Integer id, Model model) {
		String view = "show";
		Host host = dao.findHostById(id);
		model.addAttribute("host", host);
		return view;
	}
	
	@RequestMapping(path = "createHost.do", method = RequestMethod.POST)
	public ModelAndView createUser(Host host) {
		dao.createHost(host);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping(path = "updateHostPage.do", method = RequestMethod.POST)
	public ModelAndView updateHost(@RequestParam("host") int id) {
		Host host = dao.findHostById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("host", host);
		mv.setViewName("updateHost");
		return mv;
	}
	
	@RequestMapping(path = "updateHost.do", method = RequestMethod.POST)
	public String updateUser(@RequestParam("id")int id, Host host, Location loc) {
		dao.updateHost(host, id, loc);
		return "index";
	}
	
	@RequestMapping(path = "listHosts.do")
	public String showHosts(Model model) {
		model.addAttribute("hosts", dao.findAll());
		return "listAllHosts";
	}
	
	@RequestMapping(path = "deleteHost.do", method = RequestMethod.POST)
	public String deleteHost(@RequestParam("hostId") int id) {
		Host host = dao.findHostById(id);
		dao.deleteHost(host.getId());
		return "index";
	}
	
	
//	@RequestMapping(path = "deactivateHost.do", method = RequestMethod.POST)
//	public String deactivateHost(int hostId, Model model) {
//		adm.deactivate(hostId);
//		model.addAttribute("hosts", dao.findAll());
//		return "listAllHosts";
//	}
}
