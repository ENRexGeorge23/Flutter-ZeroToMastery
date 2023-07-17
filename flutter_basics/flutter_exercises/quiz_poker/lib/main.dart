import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_poker/add_question_widget.dart';
import 'package:quiz_poker/navigation_bar.dart';
import 'package:quiz_poker/question_detail_screen.dart';
import 'package:quiz_poker/question_item_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      ),
      debugShowCheckedModeBanner: false,
      home: const RootBottomNavigation(),
    );
  }
}
