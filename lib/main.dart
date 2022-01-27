import 'package:flodo/pages/form_page.dart';
import 'package:flodo/pages/home_page.dart';
import 'package:flodo/pages/settings_page.dart';
import 'package:flodo/providers/theme_mode_provider.dart';
import 'package:flodo/providers/todo_provider.dart';
import 'package:flodo/themes/base_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Wrapper());
}

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => TodoProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => ThemeModeProvider())
      ],
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: context.select<ThemeModeProvider, ThemeMode>((value) => value.current),
      darkTheme: BaseTheme.dark(),
      theme: BaseTheme.get(),
      home: const HomePage(),
      routes: {
        "/add": (BuildContext context) => const FormPage(mode: FormPageMode.add),
        "/update": (BuildContext context) => const FormPage(mode: FormPageMode.update),
        '/settings': (BuildContext context) => const SettingsPage()
      },
    );
  }
}
