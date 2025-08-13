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
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(title: const Text('Catatan')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _titleController,
                  style: theme.textTheme.bodyLarge,
                  decoration: InputDecoration(
                    labelText: 'Judul',
                    labelStyle: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.primary),
                    filled: true,
                    fillColor: theme.cardColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: theme.dividerColor),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _contentController,
                  style: theme.textTheme.bodyLarge,
                  decoration: InputDecoration(
                    labelText: 'Isi Catatan',
                    labelStyle: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.primary),
                    filled: true,
                    fillColor: theme.cardColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: theme.dividerColor),
                    ),
                  ),
                  minLines: 1,
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      textStyle: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _addNote,
                    child: const Text('Tambah Catatan'),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: theme.dividerColor),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return Card(
                  color: theme.cardColor,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    title: Text(note.title, style: theme.textTheme.titleLarge),
                    subtitle: Text(note.content, style: theme.textTheme.bodyMedium),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: theme.colorScheme.error),
                      onPressed: () => _deleteNote(index),
                    ),
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
