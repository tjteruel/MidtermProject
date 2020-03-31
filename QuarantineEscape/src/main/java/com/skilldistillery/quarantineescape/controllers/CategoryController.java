package com.skilldistillery.quarantineescape.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.quarantineescape.data.CategoryDAO;
import com.skilldistillery.quarantineescape.entities.Category;
import com.skilldistillery.quarantineescape.entities.User;

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
		mv.addObject("categories", category);
		mv.setViewName("index");
		return mv;
	}
	

	@RequestMapping(path = "deleteCategory.do", method = RequestMethod.POST)
	public String deleteUser(@RequestParam("categoryId") int id) {
		Category category = categoryDao.findCategoryById(id);
		categoryDao.deleteCategory(category.getId());
		return "index";
	}


	@RequestMapping(path = "updateCategoryPage.do", method = RequestMethod.POST)
	public ModelAndView updateUser(@RequestParam("category") int id) {
		Category category= categoryDao.findCategoryById(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("category", category);
		mv.setViewName("updateCategory");
		return mv;
	}
	
	@RequestMapping(path = "updateCategory.do", method = RequestMethod.POST)
	public String updateUser(@RequestParam("id")int id, Category category) {
		categoryDao.updateCategory(category, id);
		return "index";
	}
	
	
	@RequestMapping(path = "listCategories.do")
	public String showCategories(Model model) {
		model.addAttribute("categories",categoryDao.findAll()) ;
		return "categorydisplay";
	}

}
