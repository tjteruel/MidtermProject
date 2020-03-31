package com.skilldistillery.quarantineescape.entities;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class User {

	// F I E L D S

	// Might need an email?????

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	private String password;

	@Column(name = "user_image_url")
	private String userImageUrl;

	@Column(name = "create_date")
	private LocalDate createdAt;

	@Column(name = "user_description")
	private String userDescription;

	private Boolean enabled;

	private String role;

	@OneToMany(mappedBy = "user")
	private List<CategoryComment> categoryComments;

	@OneToMany(mappedBy = "user")
	private List<UserEvent> userEvents;

	@OneToMany(mappedBy = "user")
	private List<EventComment> eventComments;
	
	
	@OneToMany(mappedBy="user")
	private List<Tag> tags;
	
	private String email = "xxx@email.com";

	////////////////////////////////////////////

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public List<EventComment> getEventComments() {
		return eventComments;
	}

	public void setEventComments(List<EventComment> eventComments) {
		this.eventComments = eventComments;
	}

	public List<UserEvent> getUserEvents() {
		return userEvents;
	}

	public LocalDate getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDate createdAt) {
		this.createdAt = createdAt;
	}

	public void setUserEvents(List<UserEvent> userEvents) {
		this.userEvents = userEvents;
	}

	public List<CategoryComment> getCategoryComments() {
		return categoryComments;
	}

	public void setCategoryComments(List<CategoryComment> categoryComments) {
		this.categoryComments = categoryComments;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserImageUrl() {
		return userImageUrl;
	}

	public void setUserImageUrl(String userImageUrl) {
		this.userImageUrl = userImageUrl;
	}

	public String getUserDescription() {
		return userDescription;
	}

	public void setUserDescription(String userDescription) {
		this.userDescription = userDescription;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public User() {
		super();
	}

	public User(int id, String username, String firstName, String lastName, String password, String userImageUrl,
			LocalDate createdAt, String userDescription, Boolean enabled, String role,
			List<CategoryComment> categoryComments, List<UserEvent> userEvents) {
		super();
		this.id = id;
		this.username = username;
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;
		this.userImageUrl = userImageUrl;
		this.createdAt = createdAt;
		this.userDescription = userDescription;
		this.enabled = enabled;
		this.role = role;
		this.categoryComments = categoryComments;
		this.userEvents = userEvents;
	}

	public User(int id, String username, String firstName, String lastName, String password, String userImageUrl,
			LocalDate createdAt, String userDescription, Boolean enabled, String role,
			List<CategoryComment> categoryComments, List<UserEvent> userEvents, List<EventComment> eventComments,
			List<Tag> tags, String email) {
		super();
		this.id = id;
		this.username = username;
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;
		this.userImageUrl = userImageUrl;
		this.createdAt = createdAt;
		this.userDescription = userDescription;
		this.enabled = enabled;
		this.role = role;
		this.categoryComments = categoryComments;
		this.userEvents = userEvents;
		this.eventComments = eventComments;
		this.tags = tags;
		this.email = email;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", password=" + password + ", userImageUrl=" + userImageUrl + ", createdAt=" + createdAt
				+ ", userDescription=" + userDescription + ", enabled=" + enabled + ", role=" + role + ", email: " + email;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((categoryComments == null) ? 0 : categoryComments.hashCode());
		result = prime * result + ((createdAt == null) ? 0 : createdAt.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((enabled == null) ? 0 : enabled.hashCode());
		result = prime * result + ((eventComments == null) ? 0 : eventComments.hashCode());
		result = prime * result + ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result + id;
		result = prime * result + ((lastName == null) ? 0 : lastName.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((role == null) ? 0 : role.hashCode());
		result = prime * result + ((tags == null) ? 0 : tags.hashCode());
		result = prime * result + ((userDescription == null) ? 0 : userDescription.hashCode());
		result = prime * result + ((userEvents == null) ? 0 : userEvents.hashCode());
		result = prime * result + ((userImageUrl == null) ? 0 : userImageUrl.hashCode());
		result = prime * result + ((username == null) ? 0 : username.hashCode());
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
		User other = (User) obj;
		if (categoryComments == null) {
			if (other.categoryComments != null)
				return false;
		} else if (!categoryComments.equals(other.categoryComments))
			return false;
		if (createdAt == null) {
			if (other.createdAt != null)
				return false;
		} else if (!createdAt.equals(other.createdAt))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (enabled == null) {
			if (other.enabled != null)
				return false;
		} else if (!enabled.equals(other.enabled))
			return false;
		if (eventComments == null) {
			if (other.eventComments != null)
				return false;
		} else if (!eventComments.equals(other.eventComments))
			return false;
		if (firstName == null) {
			if (other.firstName != null)
				return false;
		} else if (!firstName.equals(other.firstName))
			return false;
		if (id != other.id)
			return false;
		if (lastName == null) {
			if (other.lastName != null)
				return false;
		} else if (!lastName.equals(other.lastName))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (role == null) {
			if (other.role != null)
				return false;
		} else if (!role.equals(other.role))
			return false;
		if (tags == null) {
			if (other.tags != null)
				return false;
		} else if (!tags.equals(other.tags))
			return false;
		if (userDescription == null) {
			if (other.userDescription != null)
				return false;
		} else if (!userDescription.equals(other.userDescription))
			return false;
		if (userEvents == null) {
			if (other.userEvents != null)
				return false;
		} else if (!userEvents.equals(other.userEvents))
			return false;
		if (userImageUrl == null) {
			if (other.userImageUrl != null)
				return false;
		} else if (!userImageUrl.equals(other.userImageUrl))
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}
	

/////////////////////////////////////////



}
