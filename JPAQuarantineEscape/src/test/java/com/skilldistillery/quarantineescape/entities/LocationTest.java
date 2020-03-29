package com.skilldistillery.quarantineescape.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class LocationTest {

	static EntityManagerFactory emf;
	private EntityManager em;
	private Location location;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("QuarantineEscapePU");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		location = em.find(Location.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		location = null;
	}

	@Test
	void test() {

		assertNotNull(location.getEvents());

	}
}
