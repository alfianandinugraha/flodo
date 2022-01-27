import 'package:flutter/material.dart';

class BaseTheme {
  static String fontFamily = 'OpenSans';

  static ThemeData get() {
    return ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: 'OpenSans',
      textTheme: const TextTheme(
        headline5: TextStyle(
          fontWeight: FontWeight.w700,
        ),
        caption: TextStyle(
          color: Colors.black
        )
      )
    );
  }

  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      textTheme: BaseTheme.get().textTheme.apply(
        bodyColor: Colors.white,
        fontFamily: BaseTheme.fontFamily,
      ).copyWith(
        caption: const TextStyle(
          color: Colors.white
        )
      ),
    );
  }
}