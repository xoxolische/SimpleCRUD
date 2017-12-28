package com.crud.dao.impl;

import org.springframework.stereotype.Repository;

import com.crud.dao.NoteDao;
import com.crud.model.Note;

@Repository
public class NoteDaoImpl extends AbstractDaoImpl<Note, Long> implements NoteDao {

	public NoteDaoImpl() {
		super(Note.class);
	}

}
