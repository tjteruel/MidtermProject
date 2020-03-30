package com.skilldistillery.quarantineescape.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.quarantineescape.entities.Category;
import com.skilldistillery.quarantineescape.entities.Event;
import com.skilldistillery.quarantineescape.entities.Location;
@Service
@Transactional
public class LocationDAOImpl implements LocationDAO{
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Location createLocation(Location location) {
		em.persist(location);
		em.flush();
		return location;
	}

	@Override
	public boolean deleteLocation(int locationId) {
		Location location = em.find(Location.class, locationId);
		em.remove(location);
		em.flush();
		if (location ==null) {
			return true;
		}
		return false;
	}

	@Override
	public Location updateLocation(Location location, int locationId) {
		Location updatedLocation = em.find(Location.class, locationId);
		
		updatedLocation.setAddress(location.getAddress());
		updatedLocation.setCity(location.getCity());
		updatedLocation.setCountry(location.getCity());
		updatedLocation.setEvents(location.getEvents());
		updatedLocation.setHosts(location.getHosts());
		updatedLocation.setPostalCode(location.getPostalCode());
		updatedLocation.setState(location.getState());
		em.flush();
		return updatedLocation;
	}

	@Override
	public Location findLocationById(int locationId) {
		Location location = em.find(Location.class, locationId);
		return location;
	}

}
