import 'package:flutter/material.dart';
import '../../models/todo.dart';
import '../../services/todo_service.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  final TodoService _todoService = TodoService();
  final TextEditingController _taskController = TextEditingController();

  void _addTodo() {
    if (_taskController.text.isNotEmpty) {
      _todoService.addTodo(Todo(task: _taskController.text));
      _taskController.clear();
      setState(() {});
    }
  }

  void _toggleTodo(int index) {
    _todoService.toggleTodo(index);
    setState(() {});
  }

  void _deleteTodo(int index) {
    _todoService.deleteTodo(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final todos = _todoService.getTodos();
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(title: const Text('To-Do List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    style: theme.textTheme.bodyLarge,
                    decoration: InputDecoration(
                      labelText: 'Tugas baru',
                      labelStyle: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.primary),
                      filled: true,
                      fillColor: theme.cardColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: theme.dividerColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                    textStyle: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  onPressed: _addTodo,
                  child: const Text('Tambah'),
                ),
              ],
            ),
          ),
          Divider(color: theme.dividerColor),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Card(
                  color: theme.cardColor,
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: Checkbox(
                      value: todo.isDone,
                      onChanged: (_) => _toggleTodo(index),
                      activeColor: theme.colorScheme.primary,
                    ),
                    title: Text(
                      todo.task,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        decoration: todo.isDone ? TextDecoration.lineThrough : null,
                        color: todo.isDone ? theme.colorScheme.secondary : theme.textTheme.bodyLarge?.color,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: theme.colorScheme.error),
                      onPressed: () => _deleteTodo(index),
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
