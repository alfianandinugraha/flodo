import 'package:flutter/material.dart';

class TodoEmptyState extends StatelessWidget {
  const TodoEmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Todo not found", style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 10),
        Text("Please add todo", style: Theme.of(context).textTheme.caption),
      ],
    );
  }
}