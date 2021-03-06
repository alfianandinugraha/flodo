import 'package:flodo/models/todo.dart';
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  TodoProvider add(Todo todo) {
    _todos = [todo, ..._todos];
    notifyListeners();
    return this;
  }

  TodoProvider finish(String id) {
    _todos = _todos.map((e) {
      if (id == e.id) {
        e.isFinish = !e.isFinish;
      }

      return e;
    }).toList();
    notifyListeners();
    return this;
  }

  TodoProvider delete(String id) {
    _todos = _todos.where((todo) => todo.id != id).toList();
    notifyListeners();
    return this;
  }

  TodoProvider update(String id, Todo todo) {
    _todos = _todos.map((e) {
      if (id == e.id) {
        e = todo;
      }

      return e;
    }).toList();
    notifyListeners();
    return this;
  }
}
