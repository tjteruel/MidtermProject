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

class UserEventTest {

	static EntityManagerFactory emf;
	private EntityManager em;
	private UserEvent userEvent;

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
		userEvent = em.find(UserEvent.class, new UserEventId(1, 1));
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		userEvent = null;
	}

	@Test
	void test() {

		assertNotNull(userEvent.getRating());
		assertEquals(4, userEvent.getRating());

	}

}
