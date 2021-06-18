import 'package:flutter/material.dart';
import 'package:sliding_pages/sliding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'content_font'),
      debugShowCheckedModeBanner: false,
      home: SlidingPages(),
    );
  }
}
