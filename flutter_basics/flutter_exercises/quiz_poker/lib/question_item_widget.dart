import 'package:flutter/material.dart';
import 'package:quiz_poker/main.dart';
import 'package:quiz_poker/quiz_poker_screen.dart';

class QuestionItem extends StatefulWidget {
  final Question question;

  const QuestionItem({super.key, required this.question});

  @override
  State<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.question.category),
      subtitle: Text(widget.question.questionText),
      leading: widget.question.questionImage != null
          ? CircleAvatar(
              backgroundImage: widget.question.questionImage,
              radius: 30,
            )
          : null,
    );
  }
}
