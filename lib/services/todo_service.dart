import '../models/todo.dart';

class TodoService {
  final List<Todo> _todos = [];

  List<Todo> getTodos() => _todos;

  void addTodo(Todo todo) {
    _todos.add(todo);
  }

  void toggleTodo(int index) {
    _todos[index].isDone = !_todos[index].isDone;
  }

  void deleteTodo(int index) {
    _todos.removeAt(index);
  }
}
