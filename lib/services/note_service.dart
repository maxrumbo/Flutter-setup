import '../models/note.dart';

class NoteService {
  final List<Note> _notes = [];

  List<Note> getNotes() => _notes;

  void addNote(Note note) {
    _notes.add(note);
  }

  void deleteNote(int index) {
    _notes.removeAt(index);
  }
}
