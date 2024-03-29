package com.austinmiljour.gamenexusmarket.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.austinmiljour.gamenexusmarket.models.Category;
import com.austinmiljour.gamenexusmarket.repositories.CategoryRepository;

@Service
public class CategoryService {

	private final CategoryRepository categoryRepo;

	public CategoryService(CategoryRepository categoryRepo) {
		this.categoryRepo = categoryRepo;
	}

	// Find All method
	public List<Category> allCategories() {
		return categoryRepo.findAll();
	}

	// Create
	public Category createCategory(Category newCategory) {
		return categoryRepo.save(newCategory);
	}

	// Find One
	public Category oneCategory(Long id) {
		Optional<Category> optionalCategory = categoryRepo.findById(id);
		if (optionalCategory.isPresent()) {
			return optionalCategory.get();
		} else {
			return null;
		}
	}

	// Update
		public Category updateCategory(Category oneCategory) {
			return categoryRepo.save(oneCategory);
		}

	// Delete
	public void deleteCategoryById(Long id) {
		categoryRepo.deleteById(id);
	}
	
}
