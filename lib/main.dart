import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainy_app/view/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
        cupertinoOverrideTheme: CupertinoThemeData(
          brightness: Brightness.light,
          primaryColor: CupertinoColors.systemBlue,
          scaffoldBackgroundColor: CupertinoColors.systemBackground,
          barBackgroundColor: CupertinoColors.systemBackground,
          textTheme: CupertinoTextThemeData(
            textStyle: TextStyle(color: CupertinoColors.label),
          ),
        ),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
        textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white)),
        cardColor: Colors.grey[800],
        cupertinoOverrideTheme: CupertinoThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: CupertinoColors.systemBackground,
          barBackgroundColor: CupertinoColors.systemBackground,
          textTheme: CupertinoTextThemeData(
            textStyle: TextStyle(color: CupertinoColors.label),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: HomePage(),
    );
  }
}
