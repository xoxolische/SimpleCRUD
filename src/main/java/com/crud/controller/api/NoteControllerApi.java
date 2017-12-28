package com.crud.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crud.model.Note;
import com.crud.service.NoteService;

@Controller
@RequestMapping(value = "/notes")
public class NoteControllerApi {

	@Autowired
	NoteService noteService;

	@PostMapping(value = "/create", produces = "application/json")
	@ResponseBody
	public Note createNote(@RequestBody Note note) {
		//note.setCreateDate(createDate);
		noteService.create(note);
		return note;
	}

	@PutMapping(value = "/update", produces = "application/json")
	@ResponseBody
	public Note editNote(@RequestBody Note note) {
		noteService.update(note);
		return noteService.get(note.getId());
	}
	
	@DeleteMapping(value = "/delete/{id}")
	@ResponseBody
	public void deleteNote(@PathVariable long id) {
		noteService.delete(id);
	}

	@RequestMapping(value = "/getAll", method = RequestMethod.GET)
	public @ResponseBody List<Note> getNotesListJson() {
		return noteService.getAll();
	}
}
