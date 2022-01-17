import 'package:flodo/models/todo.dart';
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  TodoProvider add(Todo todo) {
    _todos.add(todo);
    notifyListeners();
    return this;
  }
}
