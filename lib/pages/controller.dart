import 'package:flodo/layouts/base_layout.dart';
import 'package:flodo/models/todo.dart';
import 'package:flodo/providers/todo_provider.dart';
import 'package:flodo/widgets/todo_form.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

enum ControllerMode { add, update }

/// Controller page for update or add todo
class Controller extends StatelessWidget {
  final ControllerMode mode;

  const Controller({Key? key, required this.mode}): super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = mode == ControllerMode.add ? "Add Todo" : "Update Todo";

    return BaseLayout(
      title: title, 
      body: TodoForm(
        mode: mode,
        onSubmit: (todo) {
          if (mode == ControllerMode.add) {
            context.read<TodoProvider>().add(todo);
          }
          Navigator.pop(context);
        },
      )
    );
  }
}