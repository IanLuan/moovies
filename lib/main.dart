import 'package:flutter/material.dart';
import 'package:moovies/views/home_view.dart';
import 'package:moovies/views/markdown_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mooviess',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepPurpleAccent,
        scaffoldBackgroundColor: Colors.grey[200],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MarkdownView(),
    );
  }
}
