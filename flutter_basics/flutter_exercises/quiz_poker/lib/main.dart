
import 'package:flutter/material.dart';
import 'package:quiz_poker/navigation_bar.dart';

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
