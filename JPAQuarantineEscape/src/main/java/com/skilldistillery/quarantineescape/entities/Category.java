package com.skilldistillery.quarantineescape.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "name")
	private String categoryName;

	private String description;

	@Column(name = "category_image_url")
	private String categoryImageUrl;

	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	@JoinTable(name = "event_category", joinColumns = @JoinColumn(name = "category_id"), inverseJoinColumns = @JoinColumn(name = "event_id"))

	private List<Event> events;

	@OneToMany(mappedBy = "category")
	private List<CategoryComment> categoryComments;

	//////////////////////////

	public List<CategoryComment> getCategoryComments() {
		return categoryComments;
	}

	public void setCategoryComments(List<CategoryComment> categoryComments) {
		this.categoryComments = categoryComments;
	}

	public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategoryImageUrl() {
		return categoryImageUrl;
	}

	public void setCategoryImageUrl(String categoryImageUrl) {
		this.categoryImageUrl = categoryImageUrl;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((categoryImageUrl == null) ? 0 : categoryImageUrl.hashCode());
		result = prime * result + ((categoryName == null) ? 0 : categoryName.hashCode());
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Category other = (Category) obj;
		if (categoryImageUrl == null) {
			if (other.categoryImageUrl != null)
				return false;
		} else if (!categoryImageUrl.equals(other.categoryImageUrl))
			return false;
		if (categoryName == null) {
			if (other.categoryName != null)
				return false;
		} else if (!categoryName.equals(other.categoryName))
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (id != other.id)
			return false;
		return true;
	}

	////////////////////////////////////////////////

	//// A D D - R E M O V E

	public void addEvent(Event event) {
		if (events == null) {
			events = new ArrayList<>();
		}
		if (!events.contains(event)) {
			events.add(event);
			event.addCategory(this);
		}

	}

	public void removeEvent(Event event) {

		if (events != null && events.contains(event)) {
			events.remove(event);
			event.removeCategory(this);
		}

	}


	/////////////////////////////////////////////

	@Override
	public String toString() {
		return "Category [id=" + id + ", categoryName=" + categoryName + ", description=" + description
				+ ", categoryImageUrl=" + categoryImageUrl + "]";
	}

	public Category(int id, String categoryName, String description, String categoryImageUrl) {
		super();
		this.id = id;
		this.categoryName = categoryName;
		this.description = description;
		this.categoryImageUrl = categoryImageUrl;
	}

	public Category() {
		super();
	}

	//////////////////////////////

}
