import 'package:flutter/material.dart';
import 'package:quiz_poker/add_question_screen.dart';
import 'package:quiz_poker/main.dart';
import 'package:quiz_poker/question_detail_screen.dart';
import 'package:quiz_poker/quiz_poker_screen.dart';

class RootBottomNavigation extends StatefulWidget {
  const RootBottomNavigation({super.key});

  @override
  State<RootBottomNavigation> createState() => _RootBottomNavigationState();
}

class _RootBottomNavigationState extends State<RootBottomNavigation> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          QuizPokerScreen(),
          AddQuestionPage(
            onQuestionAdded: (Question) {},
            questions: [],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[100],
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Questions'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Question'),
        ],
      ),
    );
  }
}
