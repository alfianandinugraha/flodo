import 'package:flodo/models/todo.dart';
import 'package:flodo/pages/form_page.dart';
import 'package:flutter/material.dart';

class TodoForm extends StatefulWidget {
  final FormPageMode mode;
  final Function(Todo) onSubmit;
  final Todo? initialTodo;

  const TodoForm({
    Key? key, 
    required this.mode,
    required this.onSubmit,
    this.initialTodo
  }) : super(key: key);

  @override
  TodoFormState createState() {
    return TodoFormState();
  }
}

class TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isFinish = false;
  TextEditingController name = TextEditingController();

  @override
  void initState() {
    super.initState();
    _isFinish = widget.initialTodo?.isFinish ?? false;
    name = TextEditingController(text: widget.initialTodo?.name);
  }

  @override
  Widget build(BuildContext context) {
    String buttonText = widget.mode == FormPageMode.add ? "Add Todo" : "Update Todo";

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: name,
            decoration: const InputDecoration(
              labelText: "Todo",
              contentPadding: EdgeInsets.symmetric(vertical: 5)
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please fill this form";
              }

              return null;
            },
          ),
          const SizedBox(height: 10),
          SwitchListTile(
            value: _isFinish,
            title: const Text("Finish ?"),
            onChanged: (value) {
              setState(() {
                _isFinish = value;
              });
            }
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (!_formKey.currentState!.validate()) {
                return;
              }

              Todo todo = Todo(
                name: name.text,
                isFinish: _isFinish
              );
              widget.onSubmit(todo);
            },
            child: Text(buttonText),
          )
        ],
      ),
    );
  }
}