package com.skilldistillery.quarantineescape.data;

import com.skilldistillery.quarantineescape.entities.Location;

public interface LocationDAO {
	
	public Location createLocation(Location location);
	public boolean deleteLocation(int locationId);
	public Location updateLocation(Location location, int locationId);
	public Location findLocationById(int locationId);

}
