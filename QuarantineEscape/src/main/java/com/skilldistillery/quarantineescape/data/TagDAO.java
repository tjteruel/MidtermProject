package com.skilldistillery.quarantineescape.data;

import java.util.List;

import com.skilldistillery.quarantineescape.entities.Event;
import com.skilldistillery.quarantineescape.entities.Host;
import com.skilldistillery.quarantineescape.entities.Tag;

public interface TagDAO {
	
	public Tag createTag(Tag tag);
	public boolean deleteTag(int tagId);
	public Tag updateTag(Tag tag, int tagId);
	public Tag getTagById(int tagId);
	public List<Tag> getTagByEventId (int eventId);
	public List<Tag> findAll();

}
