import 'package:flodo/layouts/base_layout.dart';
import 'package:flodo/models/todo.dart';
import 'package:flodo/providers/todo_provider.dart';
import 'package:flodo/widgets/todo_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BaseLayout(
      title: "Todo",
      body: Consumer<TodoProvider>(
        builder: (context, data, widget) {
          return ListView.builder(
            itemCount: data.todos.length,
            itemBuilder: (BuildContext context, int position) {
              Todo todo = data.todos[position];

              return TodoCard(
                todo: todo, 
                key: Key(todo.id),
                onTap: (todo) {
                  data.finish(todo.id);
                },
                onTapDelete: (todo) {
                  data.delete(todo.id);
                },
                onTapUpdate: (todo) {
                  print("Select ${todo.id}");
                },
              );
            }
          );
        },
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