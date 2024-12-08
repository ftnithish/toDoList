import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/notes_list.dart';
import '../providers/note_provider.dart';
import '../models/note.dart';

class NotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Access the NoteProvider instance
    final noteProvider = Provider.of<NoteProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      body: NotesList(
        notes: noteProvider.notes, // Get notes from the provider
        onAddNote: () {
          // Add a new note via NoteProvider
          noteProvider.addNote(Note(
            title: 'Note ${noteProvider.notes.length + 1}',
            content: 'This is the content of the note.',
            dateTime: DateTime.now(),
          ));
        },
        onNoteTap: (note) {
          // Example: Navigate to a detailed note view or edit screen
          _openNoteDetails(context, note);
        },
      ),
    );
  }

  void _openNoteDetails(BuildContext context, Note note) {
    // Navigate to a new screen or show a dialog to view/edit the note
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(note.title),
        content: Text(note.content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}
