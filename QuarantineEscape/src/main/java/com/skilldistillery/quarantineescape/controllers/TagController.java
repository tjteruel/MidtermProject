package com.skilldistillery.quarantineescape.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.quarantineescape.data.TagDAO;

import com.skilldistillery.quarantineescape.entities.Tag;

@Controller
public class TagController {

	@Autowired
	private TagDAO dao;

	@RequestMapping(path = "createTag.do", method = RequestMethod.POST)
	public ModelAndView createUser(Tag tag) {
		dao.createTag(tag);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping(path = "deleteTag.do", method = RequestMethod.POST)
	public String deleteUser(@RequestParam("tagId") int id) {
		Tag tag = dao.getTagById(id);
		dao.deleteTag(tag.getId());
		return "tagDeleted";
	}

	@RequestMapping(path = "updateTagPage.do", method = RequestMethod.POST)
	public ModelAndView updateUser(@RequestParam("tag") int id) {
		Tag tag = dao.getTagById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("tag", tag);
		mv.setViewName("updateTag");
		return mv;
	}

	@RequestMapping(path = "updateTag.do", method = RequestMethod.POST)
	public String updateUser(@RequestParam("id") int id, Tag tag) {
		dao.updateTag(tag, id);
		return "index";
	}

	@RequestMapping(path = "findTag.do", method = RequestMethod.GET, params = "id")
	public String findUser(@RequestParam Integer id, Model model) {
		String view = "show";
		Tag tag = dao.getTagById(id);
		model.addAttribute("tag", tag);
		return view;
	}

	@RequestMapping(path = "listTags.do")
	public String showTags(Model model) {
		model.addAttribute("tags", dao.findAll());
		return "listAllTags";
	}

}
