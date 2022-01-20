import 'package:flodo/layouts/base_layout.dart';
import 'package:flodo/providers/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: "Settings", 
      body: Column(
        children: [
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: context.select<ThemeModeProvider, bool>((value) => value.isDark),
            onChanged: (value) {
              context.read<ThemeModeProvider>().toggle();
            }
          )
        ],
      )
    );
  }
}