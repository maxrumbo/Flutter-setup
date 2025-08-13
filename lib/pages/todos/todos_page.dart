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
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(labelText: 'Tugas baru'),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addTodo,
                  child: const Text('Tambah'),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  leading: Checkbox(
                    value: todo.isDone,
                    onChanged: (_) => _toggleTodo(index),
                  ),
                  title: Text(
                    todo.task,
                    style: TextStyle(
                      decoration: todo.isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteTodo(index),
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
