import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final FloatingActionButton? floatingActionButton;

  const BaseLayout({
    Key? key, 
    required this.title, 
    required this.body,
    this.floatingActionButton
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
        child: body,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
