package com.skilldistillery.quarantineescape.entities;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "user_event")
public class UserEvent {

	@EmbeddedId
	private UserEventId id;

	private Boolean attended;

	private int rating;

	@Column(name = "rating_comment")
	private String ratingComment;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	@MapsId(value="userId")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="event_id")
	@MapsId(value="eventId")
	private Event event;
	
	
	
	
	
	
	////////////////////////////

	

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public UserEventId getId() {
		return id;
	}

	public void setId(UserEventId id) {
		this.id = id;
	}

	public Boolean getAttended() {
		return attended;
	}

	public void setAttended(Boolean attended) {
		this.attended = attended;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getRatingComment() {
		return ratingComment;
	}

	public void setRatingComment(String ratingComment) {
		this.ratingComment = ratingComment;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((attended == null) ? 0 : attended.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + rating;
		result = prime * result + ((ratingComment == null) ? 0 : ratingComment.hashCode());
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
		UserEvent other = (UserEvent) obj;
		if (attended == null) {
			if (other.attended != null)
				return false;
		} else if (!attended.equals(other.attended))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (rating != other.rating)
			return false;
		if (ratingComment == null) {
			if (other.ratingComment != null)
				return false;
		} else if (!ratingComment.equals(other.ratingComment))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UserEvent [id=" + id + ", attended=" + attended + ", rating=" + rating + ", ratingComment="
				+ ratingComment + ", user=" + user + ", event=" + event + "]";
	}

	public UserEvent(UserEventId id, Boolean attended, int rating, String ratingComment) {
		super();
		this.id = id;
		this.attended = attended;
		this.rating = rating;
		this.ratingComment = ratingComment;
	}

	public UserEvent() {
		super();
	}
	
	
	
	

}
