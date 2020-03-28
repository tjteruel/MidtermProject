package com.skilldistillery.quarantineescape.entities;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class CategoryComment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String content;
	
	@Column(name = "create_date")
	private LocalDate createdAt;
	
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="category_id")
	private Category category;
	
	
	
	////////////////////////////////////////////

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public int getId() {
		return id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDate getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDate createdAt) {
		this.createdAt = createdAt;
	}

	@Override
	public String toString() {
		return "CategoryComment [id=" + id + ", content=" + content + ", createdAt=" + createdAt + ", user=" + user
				+ ", category=" + category + "]";
	}

	public CategoryComment(int id, String content, LocalDate createdAt) {
		super();
		this.id = id;
		this.content = content;
		this.createdAt = createdAt;
	}

	public CategoryComment() {
		super();
	}
	
	
	
	
	
	/////////////////////////////
	
	

}
