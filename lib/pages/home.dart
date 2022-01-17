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
      body: Selector<TodoProvider, List<Todo>>(
        builder: (context, data, widget) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int position) {
              Todo todo = data[position];

              return TodoCard(todo: todo, key: Key(todo.id));
            }
          );
        },
        selector: (context, data) => data.todos
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