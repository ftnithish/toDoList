import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/note.dart';

class NoteStorage {
  static const String _noteKey = 'notes';

  // Save notes to SharedPreferences
  static Future<void> saveNotes(List<Note> notes) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> jsonNotes = notes.map((note) => json.encode(note.toJson())).toList();
    await prefs.setStringList(_noteKey, jsonNotes);
  }

  // Load notes from SharedPreferences
  static Future<List<Note>> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? jsonNotes = prefs.getStringList(_noteKey);
    if (jsonNotes == null) return [];
    return jsonNotes.map((jsonNote) => Note.fromJson(json.decode(jsonNote))).toList();
  }
}
