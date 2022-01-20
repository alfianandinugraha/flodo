import 'package:flodo/layouts/base_layout.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseLayout(
      title: "Settings", 
      body: Text("Setting page")
    );
  }
}