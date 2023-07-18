import 'package:flutter/material.dart';

import 'package:quiz_poker/quiz_poker_screen.dart';

class QuestionDetailPage extends StatefulWidget {
  final Question question;

  const QuestionDetailPage({Key? key, required this.question})
      : super(key: key);

  @override
  State<QuestionDetailPage> createState() => _QuestionDetailPageState();
}

class _QuestionDetailPageState extends State<QuestionDetailPage>
    with SingleTickerProviderStateMixin {
  int actionCount = 0;
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(_animationController)
      ..addListener(() {
        setState(() {}); // Rebuild the widget when the animation value changes
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showNextHintOrSolution() {
    setState(() {
      actionCount++;
      if (actionCount >= 1) {
        _animationController.reset();
        _animationController.forward();
      }
    });
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
              AnimatedOpacity(
                opacity: _opacityAnimation.value,
                duration: const Duration(milliseconds: 500),
                child: Text('Hint 1: ${widget.question.hint1}'),
              ),
            ],
            if (actionCount >= 2) ...[
              const SizedBox(height: 20),
              AnimatedOpacity(
                opacity: _opacityAnimation.value,
                duration: const Duration(milliseconds: 500),
                child: Text('Hint 2: ${widget.question.hint2}'),
              ),
            ],
            if (actionCount >= 3) ...[
              const SizedBox(height: 20),
              AnimatedOpacity(
                opacity: _opacityAnimation.value,
                duration: const Duration(milliseconds: 500),
                child: Text('Solution: ${widget.question.solution}'),
              ),
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
