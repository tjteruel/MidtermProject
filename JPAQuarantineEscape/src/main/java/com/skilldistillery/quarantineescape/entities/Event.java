package com.skilldistillery.quarantineescape.entities;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;


@Entity
public class Event {
// F I E L D S

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String description;

	private String title;

	@Column(name = "event_date")
	private String eventDate;

	@Column(name = "event_time")
	private String eventTime;

	@Column(name = "link_to_event")
	private String eventLink;

	@Column(name = "public")
	private Boolean publicOrPrivate;

	@Column(name = "event_image_url")
	private String eventImageUrl;

	@Enumerated(EnumType.STRING)
	private Status status;

	private String prereqs;

	@Column(name = "create_date")
	private LocalDate createdAt;

	@ManyToMany(mappedBy = "events")
	private List<Category> categories;

	@ManyToMany(mappedBy = "events")
	private List<Tag> tags;

	@OneToMany(mappedBy = "event")
	private List<UserEvent> userEvents;
	
	@OneToMany(mappedBy="event")
	private List<EventComment> eventComments;

	@ManyToOne
	@JoinColumn(name = "host_id")
	private Host host;

	public List<EventComment> getEventComments() {
		return eventComments;
	}

	public void setEventComments(List<EventComment> eventComments) {
		this.eventComments = eventComments;
	}

	@ManyToOne
	@JoinColumn(name = "location_id")
	private Location location;
	/////////////////////////////////////////

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public Host getHost() {
		return host;
	}

	public void setHost(Host host) {
		this.host = host;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public List<UserEvent> getUserEvents() {
		return userEvents;
	}

	public void setUserEvents(List<UserEvent> userEvents) {
		this.userEvents = userEvents;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public Event() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getEventDate() {
		return eventDate;
	}

	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}

	public String getEventTime() {
		return eventTime;
	}

	public void setEventTime(String eventTime) {
		this.eventTime = eventTime;
	}

	public String getEventLink() {
		return eventLink;
	}

	public void setEventLink(String eventLink) {
		this.eventLink = eventLink;
	}

	public Boolean getPublicOrPrivate() {
		return publicOrPrivate;
	}

	public void setPublicOrPrivate(Boolean publicOrPrivate) {
		this.publicOrPrivate = publicOrPrivate;
	}

	public String getEventImageUrl() {
		return eventImageUrl;
	}

	public void setEventImageUrl(String eventImageUrl) {
		this.eventImageUrl = eventImageUrl;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public String getPrereqs() {
		return prereqs;
	}

	public void setPrereqs(String prereqs) {
		this.prereqs = prereqs;
	}

	public LocalDate getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDate createdAt) {
		this.createdAt = createdAt;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((createdAt == null) ? 0 : createdAt.hashCode());
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + ((eventDate == null) ? 0 : eventDate.hashCode());
		result = prime * result + ((eventImageUrl == null) ? 0 : eventImageUrl.hashCode());
		result = prime * result + ((eventLink == null) ? 0 : eventLink.hashCode());
		result = prime * result + ((eventTime == null) ? 0 : eventTime.hashCode());
		result = prime * result + id;
		result = prime * result + ((prereqs == null) ? 0 : prereqs.hashCode());
		result = prime * result + ((publicOrPrivate == null) ? 0 : publicOrPrivate.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
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
		Event other = (Event) obj;
		if (createdAt == null) {
			if (other.createdAt != null)
				return false;
		} else if (!createdAt.equals(other.createdAt))
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (eventDate == null) {
			if (other.eventDate != null)
				return false;
		} else if (!eventDate.equals(other.eventDate))
			return false;
		if (eventImageUrl == null) {
			if (other.eventImageUrl != null)
				return false;
		} else if (!eventImageUrl.equals(other.eventImageUrl))
			return false;
		if (eventLink == null) {
			if (other.eventLink != null)
				return false;
		} else if (!eventLink.equals(other.eventLink))
			return false;
		if (eventTime == null) {
			if (other.eventTime != null)
				return false;
		} else if (!eventTime.equals(other.eventTime))
			return false;
		if (id != other.id)
			return false;
		if (prereqs == null) {
			if (other.prereqs != null)
				return false;
		} else if (!prereqs.equals(other.prereqs))
			return false;
		if (publicOrPrivate == null) {
			if (other.publicOrPrivate != null)
				return false;
		} else if (!publicOrPrivate.equals(other.publicOrPrivate))
			return false;
		if (status != other.status)
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}

	public Event(int id, String description, String title, String eventDate, String eventTime, String eventLink,
			Boolean publicOrPrivate, String eventImageUrl, Status status, String prereqs, LocalDate createdAt) {
		super();
		this.id = id;
		this.description = description;
		this.title = title;
		this.eventDate = eventDate;
		this.eventTime = eventTime;
		this.eventLink = eventLink;
		this.publicOrPrivate = publicOrPrivate;
		this.eventImageUrl = eventImageUrl;
		this.status = status;
		this.prereqs = prereqs;
		this.createdAt = createdAt;
	}

	////////////////////////////////////////////////////
	// A D D - R E M O V E

	public void addCategory(Category category) {
		if (categories == null) {
			categories = new ArrayList<>();
		}
		if (!categories.contains(category)) {
			categories.add(category);
			category.addEvent(this);

		}

	}

	public void removeCategory(Category category) {
		if (categories != null && categories.contains(category)) {
			categories.remove(category);
			category.removeEvent(this);
		}
	}

	public void addTag(Tag tag) {

		if (tags == null) {
			tags = new ArrayList<>();
		}
		if (!tags.contains(tag)) {
			tags.add(tag);
			tag.addEvent(this);

		}

	}

	public void removeTag(Tag tag) {
		if (tags != null && tags.contains(tag)) {
			tags.remove(tag);
			tag.removeEvent(this);
		}

	}

@Override
	public String toString() {
		return "Event [id=" + id + ", description=" + description + ", title=" + title + ", eventDate=" + eventDate
				+ ", eventTime=" + eventTime + ", eventLink=" + eventLink + ", publicOrPrivate=" + publicOrPrivate
				+ ", eventImageUrl=" + eventImageUrl + ", status=" + status + ", prereqs=" + prereqs + ", createdAt="
				+ createdAt + ", host="
				+ host + ", location=" + location + "]";
	}

}
