import 'package:flodo/models/todo.dart';
import 'package:flodo/providers/theme_mode_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final Function(Todo)? onTap;
  final Function(Todo)? onTapDelete;
  final Function(Todo)? onTapUpdate;

  const TodoCard({
    Key? key, 
    required this.todo, 
    this.onTap,
    this.onTapUpdate,
    this.onTapDelete
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!(todo);
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        color: context.select<ThemeModeProvider, Color?>((value) {
          if (value.isDark) {
            return todo.isFinish ? Colors.grey[800] : Colors.grey[600];
          }

          return todo.isFinish ? Colors.grey[350] : Colors.white;
        }),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                todo.name,
                style: TextStyle(
                  decoration: todo.isFinish ? TextDecoration.lineThrough : TextDecoration.none,
                  color: context.select<ThemeModeProvider, Color?>((value) {
                    if (value.isDark) {
                      return todo.isFinish ? Colors.white54 : Colors.white;
                    }

                    return Colors.black;
                  })
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  icon: const Icon(Icons.more_vert),
                  underline: Container(
                    height: 0,
                  ),
                  items: <String>['Update', 'Delete'].map((e) {
                    return DropdownMenuItem<String>(
                      child: Text(e),
                      value: e,
                    );
                  }).toList(), 
                  onChanged: (value) {
                    String status = value.toString().toLowerCase();
                    if (status == 'update') {
                      onTapUpdate!(todo);
                    } else {
                      onTapDelete!(todo);
                    }
                  }
                ) 
              )
            ],
          ),
        ),
      ),
    );
  }
}
