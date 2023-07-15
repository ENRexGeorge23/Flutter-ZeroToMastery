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
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      ),
      debugShowCheckedModeBanner: false,
      home: const QuizPokerScreen(),
    );
  }
}

class QuizPokerScreen extends StatelessWidget {
  const QuizPokerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Poker'),
      ),
      body: const Center(
        child: Text('Quiz Poker Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('This is the Snackbar'),
            ),
          );
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
