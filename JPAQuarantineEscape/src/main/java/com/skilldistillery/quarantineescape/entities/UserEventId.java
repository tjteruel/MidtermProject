package com.skilldistillery.quarantineescape.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class UserEventId implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name = "user_id")
	private int userId;

	@Column(name = "event_id")
	private int eventId;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + eventId;
		result = prime * result + userId;
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
		UserEventId other = (UserEventId) obj;
		if (eventId != other.eventId)
			return false;
		if (userId != other.userId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UserEventId [userId=" + userId + ", eventId=" + eventId + "]";
	}

	public UserEventId(int userId, int eventId) {
		super();
		this.userId = userId;
		this.eventId = eventId;
	}

	public UserEventId() {
		super();
	}

	
	
}
