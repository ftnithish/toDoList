import 'package:flutter/material.dart';
import '../models/note.dart';

class NotesList extends StatelessWidget {
  final List<Note> notes;
  final VoidCallback onAddNote;
  final Function(Note) onNoteTap;

  const NotesList({
    Key? key,
    required this.notes,
    required this.onAddNote,
    required this.onNoteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(
                  "Created on: ${note.dateTime}",
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: () => onNoteTap(note),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: FloatingActionButton(
            onPressed: onAddNote,
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
