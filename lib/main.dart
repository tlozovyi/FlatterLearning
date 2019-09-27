import 'package:flutter/material.dart';
import 'package:test_drive_app/main_navigation.dart';
import 'package:test_drive_app/random_words_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepPurple,
      ),
      home: MainNavigation()
    );
  }
}
