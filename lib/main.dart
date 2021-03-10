import 'package:flutter/material.dart';
import 'package:moovies/views/home_view.dart';
import 'package:moovies/views/markdown_view.dart';
import 'package:moovies/views/bubbles.dart';

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
        primaryColor: Color(0xFF1432C5),
        scaffoldBackgroundColor: Colors.grey[100],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(),
    );
  }
}
