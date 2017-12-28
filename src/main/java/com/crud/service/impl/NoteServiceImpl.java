package com.crud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crud.dao.NoteDao;
import com.crud.model.Note;
import com.crud.service.NoteService;

@Service
@Transactional
public class NoteServiceImpl implements NoteService {

	
	@Autowired
	NoteDao noteDao;
	
	@Override
	public void create(Note entity) {
		noteDao.create(entity);
	}

	@Override
	public void update(Note entity) {
		noteDao.update(entity);
	}

	@Override
	public void delete(long id) {
		noteDao.delete(id);
	}

	@Override
	public Note get(long id) {
		return noteDao.get(id);
	}

	@Override
	public void delete(Note entity) {
		noteDao.delete(entity);
	}

	@Override
	public List<Note> getAll() {
		return noteDao.getAll();
	}

}
