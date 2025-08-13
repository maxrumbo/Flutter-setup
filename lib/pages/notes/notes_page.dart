import 'package:flutter/material.dart';
import '../../models/note.dart';
import '../../services/note_service.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final NoteService _noteService = NoteService();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  void _addNote() {
    if (_titleController.text.isNotEmpty && _contentController.text.isNotEmpty) {
      _noteService.addNote(
        Note(title: _titleController.text, content: _contentController.text),
      );
      _titleController.clear();
      _contentController.clear();
      setState(() {});
    }
  }

  void _deleteNote(int index) {
    _noteService.deleteNote(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final notes = _noteService.getNotes();
    return Scaffold(
      appBar: AppBar(title: const Text('Catatan')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Judul'),
                ),
                TextField(
                  controller: _contentController,
                  decoration: const InputDecoration(labelText: 'Isi Catatan'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: _addNote,
                  child: const Text('Tambah Catatan'),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return ListTile(
                  title: Text(note.title),
                  subtitle: Text(note.content),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteNote(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
