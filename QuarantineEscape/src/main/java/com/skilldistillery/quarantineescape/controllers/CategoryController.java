package com.skilldistillery.quarantineescape.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.quarantineescape.data.CategoryDAO;
import com.skilldistillery.quarantineescape.entities.Category;

@Controller
public class CategoryController {

	@Autowired
	private CategoryDAO categoryDao;

	@RequestMapping(path = "createCategory.do", method = RequestMethod.POST)
	public ModelAndView createCategory(Category category) {
		categoryDao.createCategory(category);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	@RequestMapping(path = "getCategory.do", method = RequestMethod.GET)
	public ModelAndView getCategory(Category category) {
		categoryDao.createCategory(category);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping(path = "deleteCategory.do", params = "id")
	public ModelAndView deleteCategory(int id) {
		boolean isDeleted = categoryDao.deleteCategory(id);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("deletedCategory");
		mv.addObject("isDeleted", isDeleted);
		mv.addObject("categoryId", id);
		return mv;
	}

	@RequestMapping(path = "updateCategory.do", method = RequestMethod.POST)
	public ModelAndView updateCategory(@RequestParam("category") int id) {
		Category category = categoryDao.findCategoryById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("category", category);
		mv.setViewName("updateCategory");
		return mv;
	}

}
