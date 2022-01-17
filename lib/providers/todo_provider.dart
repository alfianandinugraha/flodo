import 'package:flodo/models/todo.dart';
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> _todos = [Todo(name: "Buy milk"), Todo(name: "Reading book")];

  List<Todo> get todos => _todos;

  TodoProvider add(Todo todo) {
    _todos = [todo, ..._todos];
    notifyListeners();
    return this;
  }
}
