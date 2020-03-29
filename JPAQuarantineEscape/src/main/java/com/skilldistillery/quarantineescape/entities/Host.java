package com.skilldistillery.quarantineescape.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Host {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	private int id;
	
	@Column(name="host_name")
	private String hostName;
	
	private String email;
	
	@Column(name="location_id")
	private int locationId;
	
	@Column(name="phone_number")
	private String phoneNumber;
	
	private String url;
	
	@Column(name="url_logo")
	private String urlLogo;
	
	
	@ManyToOne
	@JoinColumn(name="location_id")
	private Location location;
	
	
	@OneToMany(mappedBy="host")
	private List<Event> events;
	
	
	
	
	
	
	////////////////////////////////

	public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((hostName == null) ? 0 : hostName.hashCode());
		result = prime * result + id;
		result = prime * result + locationId;
		result = prime * result + ((phoneNumber == null) ? 0 : phoneNumber.hashCode());
		result = prime * result + ((url == null) ? 0 : url.hashCode());
		result = prime * result + ((urlLogo == null) ? 0 : urlLogo.hashCode());
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
		Host other = (Host) obj;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (hostName == null) {
			if (other.hostName != null)
				return false;
		} else if (!hostName.equals(other.hostName))
			return false;
		if (id != other.id)
			return false;
		if (locationId != other.locationId)
			return false;
		if (phoneNumber == null) {
			if (other.phoneNumber != null)
				return false;
		} else if (!phoneNumber.equals(other.phoneNumber))
			return false;
		if (url == null) {
			if (other.url != null)
				return false;
		} else if (!url.equals(other.url))
			return false;
		if (urlLogo == null) {
			if (other.urlLogo != null)
				return false;
		} else if (!urlLogo.equals(other.urlLogo))
			return false;
		return true;
	}

	public Host() {
		super();
	}

	public Host(int id, String hostName, String email, int locationId, String phoneNumber, String url, String urlLogo) {
		super();
		this.id = id;
		this.hostName = hostName;
		this.email = email;
		this.locationId = locationId;
		this.phoneNumber = phoneNumber;
		this.url = url;
		this.urlLogo = urlLogo;
	}

	@Override
	public String toString() {
		return "Host [id=" + id + ", hostName=" + hostName + ", email=" + email + ", locationId=" + locationId
				+ ", phoneNumber=" + phoneNumber + ", url=" + url + ", urlLogo=" + urlLogo + ", location=" + location
				+ "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getHostName() {
		return hostName;
	}

	public void setHostName(String hostName) {
		this.hostName = hostName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getLocationId() {
		return locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUrlLogo() {
		return urlLogo;
	}

	public void setUrlLogo(String urlLogo) {
		this.urlLogo = urlLogo;
	}
}
