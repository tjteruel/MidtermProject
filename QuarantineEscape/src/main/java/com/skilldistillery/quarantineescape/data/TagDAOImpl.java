package com.skilldistillery.quarantineescape.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.quarantineescape.entities.Event;
import com.skilldistillery.quarantineescape.entities.Tag;

@Service
@Transactional
public class TagDAOImpl implements TagDAO{
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Tag createTag(Tag tag) {
		em.persist(tag);
		em.flush();
		return tag;
	}

	@Override
	public boolean deleteTag(int tagId) {
		Tag tag = em.find(Tag.class, tagId);
		em.remove(tag);
		em.flush();
		if (tag == null) {
			return true;
		} 
		return false;
	}

	@Override
	public Tag updateTag(Tag tag, int tagId) {
		Tag updateTag = em.find(Tag.class, tagId);
		updateTag.setTagName(tag.getTagName());
		return null;
	}

	@Override
	public Tag getTagById(int tagId) {
		return em.find(Tag.class, tagId);
	}

	@Override
	public List<Tag> getTagByEventId(int eventId) {
		String query = "SELECT t FROM Tag t WHERE t.event.id = :eventId";
		List <Tag> tags = em.createQuery(query, Tag.class).setParameter("eventId", eventId).getResultList();
		return tags;
	}

}
