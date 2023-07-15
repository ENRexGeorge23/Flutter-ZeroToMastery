import 'package:basics/presentation/widget_examples/widget_examples_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.amber),
        ),
        debugShowCheckedModeBanner: false,
        home: const WidgetExamples());
  }
}
