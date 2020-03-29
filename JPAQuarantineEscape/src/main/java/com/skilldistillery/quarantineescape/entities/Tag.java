package com.skilldistillery.quarantineescape.entities;

import java.time.LocalDate;
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
import javax.persistence.ManyToOne;

@Entity
public class Tag {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	private int id;

	@Column(name = "user_id")
	private String userId;

	@Column(name = "tag_name")
	private String tagName;

	@Column(name = "create_date")
	private LocalDate createDate;

	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	@JoinTable(name = "event_tag", joinColumns = @JoinColumn(name = "tag_id"), inverseJoinColumns = @JoinColumn(name = "event_id"))

	private List<Event> events;
	
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;

	//////////////////////////////////////////////////

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((createDate == null) ? 0 : createDate.hashCode());
		result = prime * result + id;
		result = prime * result + ((tagName == null) ? 0 : tagName.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
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
		Tag other = (Tag) obj;
		if (createDate == null) {
			if (other.createDate != null)
				return false;
		} else if (!createDate.equals(other.createDate))
			return false;
		if (id != other.id)
			return false;
		if (tagName == null) {
			if (other.tagName != null)
				return false;
		} else if (!tagName.equals(other.tagName))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		return true;
	}

	public Tag() {
		super();
	}

	public Tag(int id, String userId, String tagName, LocalDate createDate) {
		super();
		this.id = id;
		this.userId = userId;
		this.tagName = tagName;
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "Tag [id=" + id + ", userId=" + userId + ", tagName=" + tagName + ", createDate=" + createDate
				+ ", events=" + events + ", user=" + user + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public LocalDate getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDate createDate) {
		this.createDate = createDate;
	}

/////////////////////////////////////

	////// ADD REMOVE

	public void addEvent(Event event) {

		if (events == null) {
			events = new ArrayList<>();
		}
		if (!events.contains(event)) {
			events.add(event);
			event.addTag(this);

		}

	}

	public void removeEvent(Event event) {

		if (events != null && events.contains(event)) {
			events.remove(event);
			event.removeTag(this);
		}

	}

}
