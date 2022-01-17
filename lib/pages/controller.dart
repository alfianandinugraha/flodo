import 'package:flodo/layouts/base_layout.dart';
import 'package:flutter/material.dart';

enum ControllerMode { add, update }

/// Controller page for update or add todo
class Controller extends StatelessWidget {
  final ControllerMode? mode;

  const Controller({Key? key, required this.mode}): super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = mode == ControllerMode.add ? "Add Todo" : "Update Todo";

    return BaseLayout(
      title: title, 
      body: const Text("Add todo")
    );
  }
}