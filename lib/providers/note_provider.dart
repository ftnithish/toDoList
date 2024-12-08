import 'package:flutter/material.dart';
import '../models/note.dart';

class NoteProvider extends ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes => _notes;

  void addNote(Note note) {
    _notes.add(note);
    notifyListeners(); // Notify UI to rebuild
  }

  void updateNote(Note oldNote, Note updatedNote) {
    final index = _notes.indexOf(oldNote);
    if (index != -1) {
      _notes[index] = updatedNote;
      notifyListeners();
    }
  }

  void deleteNote(Note note) {
    _notes.remove(note);
    notifyListeners();
  }

  void loadNotes(List<Note> savedNotes) {
    _notes = savedNotes;
    notifyListeners();
  }
}
