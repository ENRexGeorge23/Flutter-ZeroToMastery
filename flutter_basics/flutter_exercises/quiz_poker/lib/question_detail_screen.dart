import 'package:flutter/material.dart';

import 'package:quiz_poker/main.dart';
import 'package:quiz_poker/quiz_poker_screen.dart';

class QuestionDetailPage extends StatefulWidget {
  final Question question;

  const QuestionDetailPage({Key? key, required this.question})
      : super(key: key);

  @override
  State<QuestionDetailPage> createState() => _QuestionDetailPageState();
}

class _QuestionDetailPageState extends State<QuestionDetailPage> {
  int actionCount = 0;

  void _showNextHintOrSolution() {
    setState(() {
      actionCount++;
    });
  }

  void _goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.question.questionText),
            if (actionCount >= 1) ...[
              const SizedBox(height: 20),
              Text('Hint 1: ${widget.question.hint1}'),
            ],
            if (actionCount >= 2) ...[
              const SizedBox(height: 20),
              Text('Hint 2: ${widget.question.hint2}'),
            ],
            if (actionCount >= 3) ...[
              const SizedBox(height: 20),
              Text('Solution: ${widget.question.solution}'),
            ],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showNextHintOrSolution,
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
