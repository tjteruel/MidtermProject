package com.skilldistillery.quarantineescape.data;

import java.util.List;

import com.skilldistillery.quarantineescape.entities.Category;


public interface CategoryDAO {
	
	public Category createCategory(Category category);
	public boolean deleteCategory(int categoryId);
	public Category updateCategory(Category category, int categoryId);
	public Category findCategoryById(int categoryId);
	List<Category> findAll();
}
