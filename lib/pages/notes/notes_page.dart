import 'dart:ui';
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
      appBar: AppBar(title: const Text('Catatan'), backgroundColor: theme.colorScheme.surface.withOpacity(0.7), elevation: 0),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                    child: TextField(
                      controller: _titleController,
                      style: theme.textTheme.bodySmall?.copyWith(fontSize: 13),
                      decoration: const InputDecoration(
                        hintText: 'Judul',
                        border: UnderlineInputBorder(),
                        filled: false,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                    child: TextField(
                      controller: _contentController,
                      style: theme.textTheme.bodySmall?.copyWith(fontSize: 13),
                      decoration: const InputDecoration(
                        hintText: 'Isi Catatan',
                        border: UnderlineInputBorder(),
                        filled: false,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      ),
                      minLines: 1,
                      maxLines: 3,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: theme.colorScheme.primary,
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    textStyle: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  onPressed: _addNote,
                  child: const Text('Tambah Catatan'),
                ),
              ],
            ),
          ),
          Divider(color: theme.dividerColor, height: 4, thickness: 0.5),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                      child: Card(
                        color: theme.cardColor.withOpacity(0.25),
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 0,
                        child: ListTile(
                          title: Text(note.title, style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13)),
                          subtitle: Text(note.content, style: theme.textTheme.bodySmall?.copyWith(fontSize: 12)),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: theme.colorScheme.error, size: 18),
                            onPressed: () => _deleteNote(index),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          minLeadingWidth: 0,
                        ),
                      ),
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
