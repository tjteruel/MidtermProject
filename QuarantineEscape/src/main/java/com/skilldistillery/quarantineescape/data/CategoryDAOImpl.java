package com.skilldistillery.quarantineescape.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.quarantineescape.entities.Category;

@Service
@Transactional
public class CategoryDAOImpl implements CategoryDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Category createCategory(Category category) {
		em.persist(category);
		em.flush();
		return category;
	}

	@Override
	public boolean deleteCategory(int categoryId) {
		Category category = em.find(Category.class, categoryId);
		em.remove(categoryId);
		em.flush();
		if (category == null) {
			return true;
		} 
		return false;
	}
	
	@Override
	public Category updateCategory(Category category, int categoryId) {
		Category updateCategory = em.find(Category.class, categoryId);
		updateCategory.setCategoryName(category.getCategoryName());
		updateCategory.setDescription(category.getDescription());
		updateCategory.setCategoryImageUrl(category.getCategoryImageUrl());
		updateCategory.setEvents(category.getEvents());
		return updateCategory;
	}

	@Override
	public Category findCategoryById(int categoryId) {
		Category category = em.find(Category.class,categoryId);
		return null;
	}

}
