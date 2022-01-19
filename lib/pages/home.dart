import 'package:flodo/layouts/base_layout.dart';
import 'package:flodo/providers/todo_provider.dart';
import 'package:flodo/widgets/todo_empty_state.dart';
import 'package:flodo/widgets/todo_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BaseLayout(
      title: "Flodo",
      body: Selector<TodoProvider, bool>(
        builder: (context, data, widget) {
          return data ? const TodoEmptyState() : const TodoList();
        },
        selector: (context, data) => data.todos.isEmpty,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}